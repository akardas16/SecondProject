//
//  Gradients.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 22.04.2022.
//

import SwiftUI

struct Gradients: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25).fill(LinearGradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),.blue], startPoint: .topLeading, endPoint: .bottomTrailing)).frame(width: 300, height: 200)
        }
        
    }
}

struct Gradients_Previews: PreviewProvider {
    static var previews: some View {
        Gradients()
    }
}
