//
//  AnnotationInputView.swift
//  echo
//
//  Created by Dicka J. Lezama on 04/03/24.
//
import SwiftUI
import MapKit
import AVFoundation


struct CustomTextFieldStyle: TextFieldStyle {
    @Environment(\.colorScheme) var colorScheme
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(colorScheme == .dark ? Color(UIColor.systemBackground) : Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("ColorPrincipal"), lineWidth: 2.5)
            )
            .padding()
    }
}


struct AnnotationInputView: View {
    @StateObject private var locationManager = LocationManager()
    @Binding var showingInputForm: Bool
    @Binding var annotations: [ProblemAnnotation]
    @Binding var newAnnotationCoordinate: CLLocationCoordinate2D?
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var criticality: ProblemAnnotation.Criticality = .baja
    let criticalityLevels: [ProblemAnnotation.Criticality] = [.baja, .media, .alta]
    @State private var image: UIImage? // Estado para la imagen
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20){
                Text("Información del problema")
                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Título del problema")
                    .padding()
                    .font(.headline)
                TextField("", text: $title)
                    .textFieldStyle(CustomTextFieldStyle())
                Text("Descripción del problema")
                    .padding()
                    .font(.headline)
                TextEditor(text: $description)
                    .border(Color("ColorPrincipal"), width: 2.5)
                    .cornerRadius(14)
                    .padding()
                
                HStack {
                    Text("Severidad del problema")
                        .font(.headline)
                        .padding()
                    Picker("Critically", selection: $criticality){
                        ForEach(criticalityLevels, id: \.self) {criticality in
                            Text(criticality.rawValue.capitalized)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: CameraView(image: $image)) {
                        Text("Agregar imagen")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(Color("ColorPrincipal"))
                    .padding()
                    
                    Spacer()
                    
                }
               
                HStack {
                    Spacer()
                    
                    Button("Cancelar"){
                        showingInputForm = false
                        
                    }
                    .foregroundColor(Color("AccentColor"))
                    .padding()
                
                    Button("Denunciar"){
                        print("New pin at \(newAnnotationCoordinate)")
                        let newAnnotation = ProblemAnnotation(title: title, description: description, criticality: criticality, coordinate: newAnnotationCoordinate ?? CLLocationCoordinate2D(), imageName: "")
                        annotations.append(newAnnotation)
                        showingInputForm = false
                        
                        // Clear the textfields
                        title = ""
                        description = ""
                    }
                    .foregroundColor(Color("ColorPrincipal"))
                    .padding()
                    
                    Spacer()
                }
                
            }
            .navigationBarTitle("Denunciar problema", displayMode: .inline)
            
        }
    }
}
