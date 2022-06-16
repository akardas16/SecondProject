//
//  AfterCombine.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 22.05.2022.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI
import UIKit
import WeatherKit
import CoreLocation


class MyViewModel:ObservableObject{
    @Published var textField:String = ""
    @Published var isPrime:Bool = false
    
    init() {
        primeSubscriber()
    }
    
    func primeSubscriber(){
        $textField
            .map {self.checkPrimeOrNot(numberToCheck: Int($0) ?? 0)}
            .assign(to: &$isPrime)
    }
    func checkPrimeOrNot(numberToCheck:Int)-> Bool{
        var isPrime : Bool = false
        if numberToCheck > 2  {
            for  n in 2...(numberToCheck - 1) {
                isPrime = (numberToCheck % n ) == 0  ? false : true
                if !isPrime{
                    break
                }
            }
        } else {
            isPrime = numberToCheck == 1 ? true : false
            isPrime = numberToCheck == 0 ? false : true
        }
        return isPrime
    }
    
}

struct AfterCombine: View {
    @StateObject var vm = MyViewModel()
    @State var backColor:Color = Color.red
    @State var date:Date = Date()
    @State var toggle:Bool = false
    @State var text:String = ""
    
    
    var body: some View {
        NavigationView{
        
            VStack{
             
                Form {
                   
                    Section {
                        
                        DisclosureGroup {
                            Toggle(isOn: $toggle) {
                                Text("Subscribtion")
                            }
                            
                        } label: {
                            Text("Label")
                        }.listRowBackground(Color.red.opacity(0.1))

                        Stepper("Items") {
                            
                        } onDecrement: {
                            
                        }.listRowBackground(Color.gray.opacity(0.1))

                        Toggle(isOn: $toggle) {
                            Text("Purchases")
                        }.listRowBackground(Color.red.opacity(0.1))
                        Toggle(isOn: $toggle) {
                            Text("Configurations")
                        }.listRowBackground(Color.gray.opacity(0.1))
                    }header: {
                        Label("Settings", systemImage: "gear").font(.largeTitle).tint(.red).foregroundColor(.red)
                    }.headerProminence(.increased)

                  
                }.frame(maxHeight: 300)
              
                List{
                    ForEach(0..<20) { _ in
                        GroupBox {
                            HStack{
                                Label("Smile", systemImage: "face.smiling").font(.title).foregroundColor(.red).labelStyle(.titleAndIcon)
                                

                            }.frame(maxWidth: .infinity,alignment: .leading)
                        }
                    }

                    
                }.listStyle(.plain)
                
            }.navigationBarHidden(true)
          
        }
       
    }
    
  
}

struct AfterCombine_Previews: PreviewProvider {
    static var previews: some View {
        AfterCombine()
    }
}




