//
//  CameraViewModel.swift
//  echo
//
//  Created by Dicka J. Lezama on 24/02/24.
//

import SwiftUI

import AVFoundation

class CameraViewModel: NSObject, ObservableObject, AVCaptureFileOutputRecordingDelegate {
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCaptureMovieFileOutput()
    @Published var preview: AVCaptureVideoPreviewLayer!
    @Published var isRecording: Bool = false
    @Published var recordedURLs: [URL] = []
    @Published var previewUrl: URL?
    @Published var showPreview: Bool = false
    @Published var recordedDuration:CGFloat = 0
    @Published var maxDuration: CGFloat = 3600
    func checkPermission(){
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setUp(){
        do {
            self.session.beginConfiguration()
            let cameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            let cameraInput = try AVCaptureDeviceInput(device: cameraDevice!)
            
            let audioDevice = AVCaptureDevice.default(for: .audio)
            let audioInput = try AVCaptureDeviceInput(device: audioDevice!)
            
            if self.session.canAddInput(cameraInput) && self.session.canAddInput(audioInput) {
                self.session.addInput(cameraInput)
                self.session.addInput(audioInput)
            }
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    func startRecording(){
        let tempURL = NSTemporaryDirectory() + "\(Date()).mov"
        output.startRecording(to: URL(fileURLWithPath: tempURL), recordingDelegate: self)
        isRecording = true
    }
    func stopRecording(){
        output.stopRecording()
        isRecording = false
    }
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        print(outputFileURL)
        self.recordedURLs.append(outputFileURL)
        if self.recordedURLs.count == 1 {
            self.previewUrl = outputFileURL
            return
        }
        
        let assets = recordedURLs.compactMap { url -> AVURLAsset in return AVURLAsset(url:url)
        }
        
        self.previewUrl = nil
        
        mergeVideos(assets: assets) { exporter in exporter.exportAsynchronously{
            if exporter.status == .failed {
                print(exporter.error!)
            }
            else{
                if let finalURL = exporter.outputURL{
                    print(finalURL)
                    DispatchQueue.main.async{
                        self.previewUrl = finalURL
                    }
                }
            }
        }
            
            
        }
    }
    func mergeVideos(assets: [AVURLAsset], completion: @escaping(_ exporter: AVAssetExportSession)->()){
        
        let compostion = AVMutableComposition()
        var lastTime: CMTime = .zero
        
        guard let videoTrack = compostion.addMutableTrack(withMediaType: .video, preferredTrackID: Int32(kCMPersistentTrackID_Invalid)) else {return}
        guard let audioTrack = compostion.addMutableTrack(withMediaType: .audio, preferredTrackID: Int32(kCMPersistentTrackID_Invalid)) else {return}
        
        for asset in assets{
            do{
                try videoTrack.insertTimeRange(CMTimeRange(start: .zero, duration: asset.duration), of: asset.tracks(withMediaType: .video)[0], at: lastTime)
                if !asset.tracks(withMediaType: .audio).isEmpty {
                    try audioTrack.insertTimeRange(CMTimeRange(start: .zero, duration: asset.duration), of: asset.tracks(withMediaType: .audio)[0], at: lastTime)
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
            lastTime = CMTimeAdd(lastTime, asset.duration)
        }
        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory() + "Video WIPER -\(Date()).mp4")
        let layerInstructions = AVMutableVideoCompositionLayerInstruction(assetTrack: videoTrack)
        var transform = CGAffineTransform.identity
        transform = transform.rotated(by: 90 * (.pi / 180))
        transform = transform.translatedBy (x: 0, y: -videoTrack.naturalSize.height)
        layerInstructions.setTransform(transform, at: .zero)
        
        let instructions = AVMutableVideoCompositionInstruction ( )
        instructions.timeRange = CMTimeRange(start: .zero, duration: lastTime)
        instructions.layerInstructions = [layerInstructions]
        
        let videoComposition = AVMutableVideoComposition ()
        videoComposition.renderSize = CGSize (width: videoTrack.naturalSize.height, height: videoTrack.naturalSize.width)
        videoComposition.instructions = [instructions]
        videoComposition.frameDuration = CMTimeMake (value: 1, timescale: 30)
        
        guard let exporter = AVAssetExportSession(asset: compostion, presetName: AVAssetExportPresetHighestQuality) else{return}
        exporter.outputFileType = .mp4
        exporter.outputURL = tempURL
        exporter.videoComposition = videoComposition
        completion(exporter)
    }
}
    
