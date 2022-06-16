//
//  ThirdSwiftUI.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 17.04.2022.
//

import SwiftUI
import UIKit
import Lottie

struct ThirdSwiftUI: View {
    
    @State private var isAlertShowing = false
    @State private var onBoardingShowing = true
    @AppStorage("onBoardingStatus") var onBoarding:Bool = true
    init() {
     
              UIPageControl.appearance().currentPageIndicatorTintColor = .blue
              UIPageControl.appearance().pageIndicatorTintColor = UIColor.blue.withAlphaComponent(0.6)
       
           }
    var body: some View {

        NavigationView{
            VStack{
                Button {
                    isAlertShowing.toggle()
                } label: {
                    Text("tap mee").frame(maxWidth:.infinity).foregroundColor(.white).padding().background(.blue).cornerRadius(16)
                }.buttonStyle(MyButtonStyle()).alert(isPresented: $isAlertShowing) {
//                    Alert(title: Text("Alert Title"), message: Text("Hello Hoaw are you?"), dismissButton: .default(Text("Okey")))
                    
                    Alert(title: Text("Purchase Item"), message: Text("Are you sure to purchase?"), primaryButton: .cancel(Text("Cancel")), secondaryButton: .default(Text("Purchase"), action: {
                        print("Item purchased")
                        isAlertShowing = false
                    }))
                }

            }.navigationTitle("ThirdSwiftUI")
        }.fullScreenCover(isPresented: $onBoarding) {
            myBoardingView()
        }

      
        
    }
}


struct myBoardingView: View{
    @AppStorage("onBoardingStatus") var onBoarding:Bool = true
    @Environment(\.presentationMode) var presentationMode
    var myItems:[BoardingItems] = [BoardingItems(lottieName: "onboarding1", title: "Welcome to Tictail", describtion: "You have taken the first step to launch your own online store!",isButtonShow: false),BoardingItems(lottieName: "onboarding2", title: "Share Your Achievements", describtion: "Further along in the email, Grammarly provides some tips for how the user can improve their writing skills",isButtonShow: false),BoardingItems(lottieName: "onboarding3", title: "Getting Started", describtion: "Once you’ve gotten past the initial formalities, you want to allow them to hit the ground running with your service.",isButtonShow: true)]
    var body: some View{
        ZStack{
            TabView{
                ForEach(myItems) { item in
                    PageViewOnBoarding(boarding: item) {
                        onBoarding = true
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)).indexViewStyle(.page(backgroundDisplayMode: .always)).indexViewStyle(PageIndexViewStyle())
        }
       
    }
}


struct ThirdSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ThirdSwiftUI()
    
    }
}

struct LottieView: UIViewRepresentable {
    var name = "success"
    var loopMode: LottieLoopMode = .loop

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.backgroundBehavior = .pauseAndRestore
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
