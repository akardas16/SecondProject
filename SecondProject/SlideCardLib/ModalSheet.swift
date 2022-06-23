//
//  ModalSheet.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 18.04.2022.
//

import SwiftUI

struct ModalSheet<Content: View>: View{
    var isShowing:Binding<Bool>
    var content: Content
    var backgroundMaterial:Material = .ultraThin
    var heightAmount:CGFloat
    @State var currentHeight:CGFloat
    
    init(isShowing: Binding<Bool>,backgroundMaterial:Material = .ultraThin,heightAmount:CGFloat = 300, content: @escaping () -> Content) {
        self.isShowing = isShowing
        self.content = content()
        self.backgroundMaterial = backgroundMaterial
        self.heightAmount = heightAmount
        //self.currentHeight = heightAmount
        self.minHeight = heightAmount - 10
        self.maxHeight = heightAmount + 10
        _currentHeight = State<CGFloat>(initialValue: heightAmount)
     
    }
    
    @State var isDragging: Bool = false
    
    var minHeight:CGFloat = 390
    var maxHeight:CGFloat = 410
    
    let startOpacity:Double = 0.3
    let endOpacity:Double = 0.4
    
    var dragPercentage:Double {
        let res = Double((currentHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    var body: some View {
       
        ZStack(alignment: .bottom){
            if isShowing.wrappedValue {
                Color.black.opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage).ignoresSafeArea().onTapGesture {
                    isShowing.wrappedValue = false
                }
                
                mainView.transition(.move(edge: .bottom))
            }
        }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .center).ignoresSafeArea().animation(.spring(), value: isShowing.wrappedValue)
    }
    
    var mainView: some View {
        VStack{
            Capsule().frame(width: 60, height: 6, alignment: .center).foregroundColor(.white.opacity(0.7)).padding(.top,12)
            ZStack{
                Button {
                    isShowing.wrappedValue = false
                } label: {
                    ExitBtn().frame(width: 24, height: 24)
                }

            }.frame(maxWidth:.infinity,alignment: .trailing).padding(.horizontal)
            
            content.frame(maxHeight:.infinity).frame(maxWidth:.infinity)
            
        }.frame(height:currentHeight).frame(maxWidth:.infinity)
            .background(backgroundMaterial).cornerRadius(16)
            .animation(isDragging ? nil : .spring(),value: isShowing.wrappedValue).onDisappear {
                currentHeight = minHeight
            }.gesture(dragGesture)
    }
    
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged { val in
            
            if !isDragging {
                isDragging = true
            }
            let dragAmount = val.translation.height - prevDragTranslation.height
            
            if currentHeight > maxHeight || currentHeight < minHeight {
                currentHeight -= dragAmount / 6
            }else {
                currentHeight -= dragAmount
            }
            prevDragTranslation = val.translation
        }.onEnded { val in
            prevDragTranslation = .zero
        
            isDragging = false
            if currentHeight > maxHeight {
                currentHeight = maxHeight
            }else if currentHeight < minHeight {
                currentHeight = minHeight
            }
        }
    }
}

struct ModalSheet_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheet(isShowing: .constant(true),heightAmount: 400) {
            Text("Hello")
        }
    
    }
}
