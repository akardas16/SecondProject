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
import SlideOverCard

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    @State private var isCustomShowing: Bool = false
    
    @State private var isShowModalSheet: Bool = false
    
    @State private var showSheet:Bool = false
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        
           
            ZStack(alignment: .center) {
                Color.green.ignoresSafeArea()
                VStack {
            
              Spacer(minLength: 8)
                    Button {
                        print("hello")
                        isCustomShowing.toggle()
                     
                    } label: {
                        Text("Tap me").frame(maxWidth:.infinity).frame(height:50).background(.red).cornerRadius(25).foregroundColor(.white).padding(.horizontal,32)
                    }.disabled(isPresented).buttonStyle(MyButtonStyle())

                   
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button("Show Alert") {
                        self.text = ""
                        //self.isPresented = true
                        isShowModalSheet.toggle()
                    }
                    
                    Button("Show sheet"){
                        showSheet.toggle()
                    }.foregroundColor(.white)
                    
                    Text(text).onChange(of: scenePhase) { newPhase in
                        print("state: \(newPhase)")
                        if newPhase == .active {
                            print("state:active")
                        }else if newPhase == .background {
                            print("state:background")
                        }else if newPhase == .inactive {
                            print("state:inactive")
                        }
                    }
                }
                AZAlert(title: "Add Item", isShown: $isPresented, text: $text, onDone: { text in
                    
                })
//                CustomAlert(imageName: "info.circle.fill", message: "Hello how is going in your life", isShown: $isCustomShowing) {
//                    print("on Done clicked")
//                } onCancel: {
//                    print("on Cancel clicked")
//
//                }
                
                ModalSheet(isShowing: $isShowModalSheet, backgroundMaterial: .ultraThin)

                
            }.slideOverCard(isPresented: $showSheet, options: [.hideExitButton]) {
                VStack{
                    Text("Hello guys").foregroundColor(.primary).bold().font(.title)
                    Spacer()
                    Text("Hello guys")
                    Text("Hello guys")
                }.frame(maxWidth:.infinity).frame(height:400)
            }
            
       
      
        
    }
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
