//
//  Modifiers.swift
//  
//
//  Created by João Gabriel Pozzobon dos Santos on 24/04/21.
//

import SwiftUI

extension View {
    public func slideOverCard<Content: View>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, options: SOCOptions = [], backgroundColor: Color = Color(.systemGray6),useMaterialColor:Bool,backgroundMaterial: Material, @ViewBuilder content: @escaping () -> Content) -> some View {
        return ZStack {
            self
            SlideOverCard(isPresented: isPresented,
                          onDismiss: onDismiss,
                          options: options,
                          backgroundColor: backgroundColor,useMaterialColor: useMaterialColor,backgroundMaterial: backgroundMaterial) {
                content()
            }
        }
    }

    
    public func slideOverCard<Item: Identifiable, Content: View>(item: Binding<Item?>, onDismiss: (() -> Void)? = nil, options: SOCOptions = [], backgroundColor: Color = Color(.systemGray6),useMaterialColor:Bool,backgroundMaterial: Material, @ViewBuilder content: @escaping (Item) -> Content) -> some View {
        let binding = Binding(get: { item.wrappedValue != nil }, set: { if !$0 { item.wrappedValue = nil } })
        return self.slideOverCard(isPresented: binding, onDismiss: onDismiss, options: options, backgroundColor: backgroundColor, useMaterialColor: useMaterialColor,backgroundMaterial: backgroundMaterial,content: {
            if let item = item.wrappedValue {
                content(item)
            }
        })
        
        /*
         // This uses a binding to an optional object in a switch statement
         .slideOverCard(item: $activeCard) { item in
             switch item {
                 case .welcomeView:
                     WelcomeView()
                 case .loginView:
                     LoginView()
                 default:
                     ..........
             }
         }
         */
        
    }
    
    public func showPopUpAlert<Content: View>(isShown:Binding<Bool> , @ViewBuilder content: @escaping () -> Content) -> some View {
        return ZStack{
            self
            PopUpAlert(isShown: isShown) {
                content()
            }
        }
    }
    

    public func showModalSheet<Content: View>(isPresented: Binding<Bool>,backgroundMaterial: Material,heightAmount:CGFloat,@ViewBuilder content: @escaping () -> Content) -> some View{
        return ZStack {
            self
            ModalSheet(isShowing: isPresented, backgroundMaterial: backgroundMaterial,heightAmount: heightAmount) {
                content()
            }
        }
    }
    
    
}
