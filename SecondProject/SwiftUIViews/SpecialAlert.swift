//
//  CustomizableAlert.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 7.06.2022.
//

import SwiftUI

struct SpecialAlert<Content:View>: View {
    @Binding var isShown:Bool
    let content:Content
    
    init(isShown: Binding<Bool>,@ViewBuilder content: () -> Content){
        _isShown = isShown
        self.content = content()
    }
    
    var body: some View {
        GeometryReader{geometry in
            ZStack(alignment:.bottom){
                
                // Blur(style: .dark).ignoresSafeArea().animation(.none, value: isShown)
                if isShown {
                    Color.black.opacity(0.2).ignoresSafeArea()
                }
                 VStack(spacing:12){
                     content
                     .padding()
                     .frame(width: geometry.size.width * 0.94)
                     //.background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
                     .background(.regularMaterial)
                     .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous)).offset(x: 0, y: isShown ? 0:275).animation(.linear(duration: 2),value: isShown)
                     
                     HStack{
                         Button("Got it",role: .cancel){
                             isShown.toggle()
                         }
                     }.padding()
                         .frame(width: geometry.size.width * 0.94)
                         //.background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
                         .background(.regularMaterial)
                         .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous)).offset(x: 0, y: isShown ? 0:0).animation(.linear(duration: 2),value: isShown)
                    
                 }
                //Color.black.opacity(0.6).ignoresSafeArea()
                
               
            }.frame(maxWidth:.infinity).frame(maxHeight:.infinity)
//                .transition(AnyTransition.scale(scale: isShown ? 1 : 0.8).animation(.spring()))
//                .animation(isShown ? .spring():.none, value: isShown)
            
        }
    }
}

struct SpecialAlert_Previews: PreviewProvider {
    static var previews: some View {
        SpecialAlert(isShown: .constant(false)) {
            VStack(spacing:16) {
                //Image(systemName: "info.circle").font(.title2).foregroundColor(.blue)
                LottieView(name: "failedlottie", loopMode: .repeat(.infinity)).frame(width: 60, height: 60)
                VStack{
                    Text("You are unable to enroll program. Please try again later").foregroundColor(.black.opacity(0.8)).font(.title3).multilineTextAlignment(.center)
                }
                
            }
            
        }
    }
}
