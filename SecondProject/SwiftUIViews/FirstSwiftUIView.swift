//
//  FirstSwiftUIView.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 15.04.2022.
//

import SwiftUI
import PopBounceButton
import AlertToast

struct FirstSwiftUIView: View {
    @State private var showToast = false
    
    @State var playerCard1:String = "card2"
    @State var playerCard2:String = "card5"
    @State var playerCount1:Int = 0
    @State var playerCount2:Int = 0
    var body: some View {
      
        ZStack{
            Image("background").ignoresSafeArea()
        
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard1)
                    Spacer()
                    Image(playerCard2)
                    Spacer()
                }.toast(isPresenting: $showToast, alert: {
                    AlertToast(type: .regular, title: "Match same! No point!")
                })
                Spacer()
                
                Button {
                    
                    let rand1 = Int.random(in: 2...14)
                    let rand2 = Int.random(in: 2...14)
                    playerCard1 = "card\(rand1)"
                    playerCard2 = "card\(rand2)"
                    if rand1 > rand2 {
                        playerCount1 += 1
                    }else if rand2 > rand1 {
                        playerCount2 += 1
                    }else{
                        showToast.toggle()
                       
                    }
                    //playerCount1 += 1
                   // playerCount2 += 1
                } label: {
                    Image("dealbutton")
                }

                
                Spacer()
                
                HStack{
                    Spacer()
                    VStack(spacing:16){
                        Text("Player").bold().foregroundColor(.white).padding(.all, 8).font(.system(size: 24))
                        
                        Text(String(playerCount1)).foregroundColor(.white).font(.system(size: 20))
                    }
                    Spacer()
                    VStack(spacing:16){
                        Text("CPU").bold().foregroundColor(.white).padding(.all, 8).font(.system(size: 24))
                        
                        Text(String(playerCount2)).foregroundColor(.white).font(.system(size: 20))
                    }
                    
                    Spacer()
                   
                }
                Spacer()
            }
            
        }
        
    }
    
    
}

struct FirstSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        FirstSwiftUIView()
            
    }
}
