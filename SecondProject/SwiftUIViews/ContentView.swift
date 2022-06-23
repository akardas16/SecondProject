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


struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @State private var text: String = ""
    @State private var isCustomShowing: Bool = false
    
    @State private var isShowModalSheet: Bool = false
    
    @State private var showSheet:Bool = false
    
    @State var showSoc:Bool = false
    
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
                
               
                CustomAlert(isShown: $isCustomShowing) {
                    VStack(spacing: 32){
                        Text("Info").font(.title).bold().foregroundColor(.white)
                        Text("How do I change the code above to work with UIWindowScene instead?").foregroundColor(.white)
                        Button {
                            isCustomShowing.toggle()
                         
                        } label: {
                            Text("Close").frame(maxWidth:.infinity).frame(height:50).background(.red).cornerRadius(25).foregroundColor(.white).padding(.horizontal,32)
                        }.disabled(isPresented).buttonStyle(MyButtonStyle())
                    
                    }
                }
                
                ModalSheet(isShowing: $isShowModalSheet, backgroundMaterial: .ultraThin)

                SlideOverCard(isPresented: $showSheet,options: [.hideExitButton],backgroundColor: .cyan,useMaterialColor: true,backgroundMaterial: .ultraThinMaterial) {
                       // Here goes your super-duper cool screen
                    VStack{
                        Text("Hello guys").foregroundColor(.white).bold().font(.title)
                        Spacer()
                        Text("Hello guys").foregroundColor(.white)
                        Text("Hello guys").foregroundColor(.white)
                    }.frame(maxWidth: .infinity).frame(height: 400)
                }.animation(.spring(response: 0.35, dampingFraction: 1),value: showSheet)
                
           
                
            }
            
        
      
        
    }
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
