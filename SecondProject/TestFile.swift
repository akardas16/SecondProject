//
//  TestFile.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 17.04.2022.
//

import Foundation
import UIKit
import PopBounceButton
import SwiftUI
struct bounceButton: UIViewRepresentable{
    
    
    
    func makeUIView(context: Context) -> PopBounceButton {
        let  myBtn = PopBounceButton(frame: CGRect(x: 0, y: 0, width: 240, height: 45))
        myBtn.setTitle("click me", for: .normal)
        //myBtn.titleColor(for: )
        myBtn.backgroundColor = UIColor.red
        myBtn.layer.cornerRadius = 16
        return myBtn
    }
    func updateUIView(_ uiView: PopBounceButton, context: Context) {
        
    }
    
  
   
    
  
 
    

}
