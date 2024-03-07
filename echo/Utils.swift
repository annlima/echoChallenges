//
//  Utils.swift
//  echo
//
//  Created by Azuany Mila Cerón on 01/03/24.
//

import SwiftUI
import MessageUI

struct MailView: UIViewControllerRepresentable {


    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?

        init(isShowing: Binding<Bool>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }

        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                isShowing = false
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing,
                           result: $result)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        return vc
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {

    }
}

struct SelectButton: View {
    
    @Binding var isSelected: Bool
    @State var text: String

    var body: some View {
        ZStack {

            if isSelected {

                Text(text)
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .background(Color.colorPrincipal)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(.capsule)
                

            } else {

                Text(text)
                    .padding(.horizontal, 10)
                    .frame(height: 35)
                    .opacity(0.8)
                    .overlay {
                        Capsule()
                            .stroke(Color.colorPrincipal)
                            .shadow(color: .gray, radius: 5, x: 0, y: 2)
                    }
            }
        }
    }
}


struct CustomeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 70)
            .padding(.vertical, 10)
            .background(Color("ColorPrincipal"))
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .bold))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("ColorPrincipal"))
            )
            .clipShape(.capsule)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}


struct Utils: View {
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false

    var body: some View {

        VStack {
                
            if MFMailComposeViewController.canSendMail() {
                Button("Show mail view") {
                    self.isShowingMailView.toggle()
                }
            } else {
                Text("Can't send emails from this device")
            }
            if result != nil {
                Text("Result: \(String(describing: result))")
                    .lineLimit(nil)
            }
        }
        .sheet(isPresented: $isShowingMailView) {
            MailView(isShowing: self.$isShowingMailView, result: self.$result)
        }

    }
}

#Preview {
    Utils()
}
