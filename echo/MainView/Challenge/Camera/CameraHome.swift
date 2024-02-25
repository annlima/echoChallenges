//
//  CameraHome.swift
//  echo
//
//  Created by Dicka J. Lezama on 25/02/24.
//

import SwiftUI

import AVKit

struct CameraHome: View {
    @StateObject var cameraModel = CameraViewModel()
    var body: some View {
        ZStack(alignment: .bottom){
            //Vista de la cámara
            CameraView().environmentObject(cameraModel)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(.top, 10)
                .padding(.bottom, 30)
            
            //Controles
            ZStack{
               
                Button {
                    if cameraModel.isRecording{
                        cameraModel.stopRecording()
                    } else {
                        cameraModel.startRecording()
                    }
                } label: {
                    Image(systemName: "video.circle")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .opacity(cameraModel.isRecording ? 0 : 1)
                        .padding(0.5)
                        .frame(width: 60, height: 60)
                        .background{
                            Circle()
                                .stroke(cameraModel.isRecording ? .clear: .white)
                        }.background{
                            Circle()
                                .fill(cameraModel.isRecording ? .red : .white)
                        }
                    
                }
                //Vista Previa del Video
                Button{
                    if let _ = cameraModel.previewUrl{
                        cameraModel.showPreview.toggle()
                    }
                } label:{
                    Group{
                        if cameraModel.previewUrl == nil && cameraModel.recordedURLs.isEmpty{
                            ProgressView()
                                .tint(.black)
                        }
                        else{
                            Image(systemName: "arrow.right.circle")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                        }
                    }
                } .offset(x:140, y:-1.5)
                    .padding(0.5)
                    .frame(width: 60, height: 60)
                    .opacity((cameraModel.previewUrl == nil && cameraModel.recordedURLs.isEmpty) || cameraModel.isRecording ? 0 : 1)
            }.frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 10)
                .padding(.bottom, 30)
            
            Button{
                cameraModel.recordedDuration = 0
                cameraModel.previewUrl = nil
                cameraModel.recordedURLs.removeAll()
            } label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.white)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .padding(.top)
        } .overlay(content:{
            if let url = cameraModel.previewUrl, cameraModel.showPreview{
                FinalPreview(url: url, showPreview: $cameraModel.showPreview)
                    .transition(.move(edge:.trailing))
            }
        }).animation(.easeInOut, value: cameraModel.showPreview)
            .preferredColorScheme(.dark)
    }
}

struct CameraHome_Previews: PreviewProvider {
    static var previews: some View {
        CameraHome()
    }
}

struct FinalPreview: View{
    var url: URL
    @Binding var showPreview: Bool
    var body: some View{
        GeometryReader{proxy in
            let size = proxy.size
            
            VideoPlayer(player: AVPlayer(url: url))
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .overlay(alignment: .topLeading){
                    Button{
                        showPreview.toggle()
                    } label: {
                        Label {
                            Text("Back")
                        } icon: {
                            Image(systemName: "chevron.left")
                        }.foregroundColor(.white)
                    } .padding(.leading)
                        .padding(.top, 22)
                }
        }
    }
}

