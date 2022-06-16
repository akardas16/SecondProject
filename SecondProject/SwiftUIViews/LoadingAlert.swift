//
//  LoadingAlert.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 24.04.2022.
//

import SwiftUI
import AlertToast

struct LoadingAlert: View {
    let screenSize = UIScreen.main.bounds
    @Binding var isShown: Bool
    var body: some View {
        ZStack{
            if isShown {
                Blur(style: .systemThinMaterialDark).ignoresSafeArea()
                
            }
        }.toast(isPresenting: $isShown) {
            AlertToast(displayMode: .alert, type: .loading, title: "Loading")
        }
    }
}

struct LoadingAlert_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAlert(isShown: .constant(true))
    }
}
