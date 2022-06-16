//
//  AZAlert.swift
//  HelloAlertSwiftUI
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//
import SwiftUI

struct AZAlert: View {
    
    let screenSize = UIScreen.main.bounds
    var title: String = ""
    @Binding var isShown: Bool
    @Binding var text: String
    var onDone: (String) -> Void = { _ in }
    var onCancel: () -> Void = { }
    
    
    var body: some View {
    
        ZStack{
            if isShown {

                Blur(style: .systemThinMaterialDark).ignoresSafeArea()
                VStack(spacing: 20) {
                    Text(title)
                        .font(.headline)
                    Text("Message")
                    TextField("", text: $text)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack(spacing: 20) {
                        Button("Done") {
                            self.isShown = false
                            self.onDone(self.text)
                        }
                        Button("Cancel") {
                            self.isShown = false
                            self.onCancel()
                        }
                    }
                }
                .padding()
                .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
                .background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                .offset(y: isShown ? 0 : screenSize.height)
//
            }
           
        }.offset(y: isShown ? 0 : screenSize.height)
            .animation(.spring(),value: isShown)
        

    }
}

struct AZAlert_Previews: PreviewProvider {
    static var previews: some View {
        AZAlert(title: "Add Item", isShown: .constant(true), text: .constant(""))
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
