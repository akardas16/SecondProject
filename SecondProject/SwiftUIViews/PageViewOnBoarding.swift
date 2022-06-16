//
//  PageViewOnBoarding.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 20.04.2022.
//

import SwiftUI

struct PageViewOnBoarding: View {
    
     var boarding:BoardingItems
     var onFinished: () -> Void = { }
    
    var offSet:CGFloat = 20
    @State var isAppeared = false
    var body: some View {
        
        ZStack{
      
            VStack{
        
                Spacer()
              
                LottieView(name: boarding.lottieName, loopMode: .repeat(.infinity)).frame(maxWidth:.infinity).frame(height: 300, alignment: .center)
                
            
                
                Spacer()
                Spacer()
             
                Text(boarding.title).fixedSize(horizontal: false, vertical: true).frame(maxWidth:.infinity).padding(.all,12).font(.system(size: 28, weight: .semibold, design: .rounded)).foregroundColor(.black).offset(x: 0, y: isAppeared ? 0 : 30).opacity(isAppeared ? 1:0).animation(isAppeared ? .easeOut(duration: 0.6).delay(0.5) : .none, value: isAppeared)
                
                Text(boarding.describtion).fixedSize(horizontal: false, vertical: true).frame(maxWidth:.infinity).padding(.all,12).font(.system(size: 19)).foregroundColor(Color.black).frame(alignment:.center).multilineTextAlignment(.center).offset(x: 0, y: isAppeared ? 0 : 30).opacity(isAppeared ? 1:0).animation(isAppeared ? .easeOut(duration: 0.6).delay(0.5) : .none, value: isAppeared)
                
                Spacer()
                
                
                    Button {
                        
                        self.onFinished()
                     
                    } label: {
                        Text("Let's Start").font(.system(size: 18, weight: .semibold, design: .rounded)).frame(maxWidth:.infinity).frame(height:50).background(.blue).cornerRadius(25).foregroundColor(.white)
                    }.buttonStyle(MyButtonStyle()).setVisibility(isShowing: boarding.isButtonShow).padding().offset(x: 0, y: isAppeared ? 0 : 30).opacity(isAppeared ? 1:0).animation(isAppeared ? .easeOut(duration: 0.6).delay(0.5) : .none, value: isAppeared)
                
              
                Spacer()
               
            }
        }.onAppear {
            isAppeared.toggle()
        }.onDisappear {
            isAppeared.toggle()
        }
    }
}

struct BoardingItems:Identifiable {
    let id:UUID = UUID()
    var lottieName:String
    var title:String
    var describtion:String
    var isButtonShow:Bool
}
struct PageViewOnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        PageViewOnBoarding(boarding: BoardingItems(lottieName: "onboarding1", title: "Welcome to Tictail", describtion: "You have taken the first step to launch your own online store!",isButtonShow: true))
    }
}
extension View {
    func setVisibility(isShowing: Bool) -> some View {
        isShowing ? AnyView(self) : AnyView(self.hidden())
    }
}
