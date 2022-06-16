//
//  AnimationView.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 21.04.2022.
//

import SwiftUI

struct AnimView: View {
    
    @State var isAnimate:Bool = false
    var body: some View {
        VStack{
            Spacer()
            Button {
                isAnimate.toggle()
            } label: {
                Text("Not a member? **Sign In**").foregroundColor(.black).font(.system(size: 24, weight: .regular)).padding(.all,8)
            }
            Spacer()
//            RoundedRectangle(cornerRadius: 25).fill(isAnimate ? .red: .green).frame(width: isAnimate ? 150: 250, height: isAnimate ? 150: 250, alignment: .center).animation(.spring(response: 0.35, dampingFraction: 0.45).repeatForever(autoreverses: true), value: isAnimate)
            
            Spacer()
            Spacer()
            Circle().trim(from: 0.0, to: 0.5).stroke(LinearGradient(gradient: Gradient(colors: [.blue, .red, .purple]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 10, lineCap: .round, dash: [15])).frame(width: 120, height: 120).rotationEffect(.degrees(isAnimate ? 360:0)).animation(.easeOut.repeatForever(autoreverses: false),value: isAnimate)
            Spacer()
            
            Capsule(style: .continuous).frame(width: 120, height: 60).foregroundColor(.orange)
            Spacer()
            ZStack(alignment: .center){
                RoundedRectangle(cornerRadius: 25).fill(isAnimate ? .purple: .green).frame(width: 200, height:200, alignment: .center).shadow(radius: 25)
                
                Text("Hello, I am text").foregroundColor(.red).bold().font(.system(size: 25))
            }.offset(y: isAnimate ? 20:0).animation(.easeOut(duration: 0.8).repeatForever(autoreverses: true), value: isAnimate)
            
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimView()
    }
}
