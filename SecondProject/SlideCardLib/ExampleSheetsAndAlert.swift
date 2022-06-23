//
//  ContentView.swift
//  HelloAlertSwiftUI
//
//  Created by Mohammad Azam on 7/29/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI
import UIKit
import Lottie


struct ExampleSheetsAndAlert: View {
    
    @State private var isCustomShowing: Bool = false
    
    @State private var isShowModalSheet: Bool = false
    
    @State private var showSheet:Bool = false
    
    var body: some View {
        
           
            ZStack(alignment: .center) {
                Color.green.ignoresSafeArea()
                VStack(spacing: 45) {
            
                    Button {
                        isCustomShowing.toggle()
                    } label: {
                        Text("Show Pop Up").foregroundColor(.white)
                            .font(.title3)
                            .frame(maxWidth:.infinity)
                            .padding()
                            .background {
                                Capsule(style: .continuous).fill(.red)
                            }.padding(.horizontal,32)
                    }.buttonStyle(bounceButtonStyle())


                    Button {
                        isShowModalSheet.toggle()
                    } label: {
                        Text("Unclosable Sheet").foregroundColor(.white)
                            .font(.title3)
                            .frame(maxWidth:.infinity)
                            .padding()
                            .background {
                                Capsule(style: .continuous).fill(.blue)
                            }.padding(.horizontal,32)
                    }.buttonStyle(bounceButtonStyle())
                    
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Closable Sheet").foregroundColor(.white)
                            .font(.title3)
                            .frame(maxWidth:.infinity)
                            .padding()
                            .background {
                                Capsule(style: .continuous).fill(.orange)
                            }.padding(.horizontal,32)
                    }.buttonStyle(bounceButtonStyle())
                    
                    
                }
            
       
            }.showPopUpAlert(isShown: $isCustomShowing) {
                VStack(spacing: 32){
                    Text("Info").font(.title).bold().foregroundColor(.white)
                    Text("How do I change the code above to work with UIWindowScene instead?").foregroundColor(.white)
                    Button {
                        isCustomShowing.toggle()
                     
                    } label: {
                        Text("Close").frame(maxWidth:.infinity).frame(height:50).background(.red).cornerRadius(25).foregroundColor(.white).padding(.horizontal,32)
                    }.buttonStyle(bounceButtonStyle())
                
                }
            }.slideOverCard(isPresented: $showSheet, options: [.hideExitButton], useMaterialColor: true, backgroundMaterial: .ultraThinMaterial) {
                VStack{
                    Text("Hello guys").foregroundColor(.white).bold().font(.title)
                    Text("Hello guys").foregroundColor(.white)
                    Text("Hello guys").foregroundColor(.white)
                }.frame(maxWidth: .infinity).frame(height: 400)
            }.showModalSheet(isPresented: $isShowModalSheet, backgroundMaterial: .ultraThinMaterial,heightAmount: 600) {
                Text("This is test modal sheet").foregroundColor(.white)
            }
            
        
      
        
    }
  
}

struct bounceButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? CGFloat(0.85) : 1.0)
            .animation(Animation.spring(response: 0.35, dampingFraction: 0.35), value: configuration.isPressed)
    }
}

struct ExampleSheetsAndAlert_Previews: PreviewProvider {
    static var previews: some View {
        ExampleSheetsAndAlert()
    }
}
