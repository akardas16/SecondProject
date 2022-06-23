//
//  SecondSwiftUI.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 15.04.2022.
//

import SwiftUI
import PopBounceButton
import UIKit
import AlertToast
import PasswordTextField
import LoadingButton

struct SecondSwiftUI: View {
    @State private var showToast = false
    @State var isLoading: Bool = false
    @State var count:Int = 0
       var style = LoadingButtonStyle(width: 312,
                                 height: 54,
                                 cornerRadius: 27,
                                 backgroundColor: .orange,
                                 loadingColor: Color.orange,
                                 strokeWidth: 3,
                                      strokeColor: .white)
    
    var body: some View {
       
        VStack{
            Spacer()
            
            Text(String(count))
            Spacer()
            Button {
                count+=1
                print("hello")
            } label: {
                VStack(spacing:8){
                    Image(systemName: "trash")
                    Image(systemName: "trash")
                }
            }

            Spacer()
            VStack(alignment: .center, spacing: 16){
                Button {
                    print("clicked")
                   // showToast.toggle()
                   
                    SecondProject.showToast(message: "windows' was deprecated in iOS 15.0: Use UIWindowScene.windows", font: .systemFont(ofSize: 17),duration: 3.0)
//
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                     let myAlertPopUp = storyboard.instantiateViewController(withIdentifier: "alertTwoButton") as! CustomAlertController
//
//                     myAlertPopUp.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//                     myAlertPopUp.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//                    let scenes = UIApplication.shared.connectedScenes
//                    let windowScene = scenes.first as? UIWindowScene
//                    let window = windowScene?.windows.first
//                    window?.rootViewController?.present(myAlertPopUp, animated: false, completion: nil)
//
//                     myAlertPopUp.dialogText.text = "'windows' was deprecated in iOS 15.0: Use UIWindowScene.windows"
//                     myAlertPopUp.imageInfo.image = UIImage(systemName: "info.circle.fill")
                
                } label: {
//                    Text("just like that").frame(maxWidth:.infinity)
//                        .font(Font.body.bold())
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color("myColor1")).cornerRadius(25).padding(.horizontal,32)
                    Label("Sign Up", systemImage: "book.fill").frame(maxWidth:.infinity).frame(height:40)
                      
                }.buttonStyle(.bordered).buttonStyle(MyButtonStyle()).cornerRadius(25).tint(.blue).padding(.horizontal,32).toast(isPresenting: $showToast, alert: {
                    AlertToast(displayMode:.alert,type: .loading, title: "Message Sent!")
                 
                    
                })
            }
            Button {
                
            } label: {
                Label("Sign Up", systemImage: "book.fill").foregroundColor(.green).font(.system(size: 18, weight: .regular, design: .rounded))
                    .frame(maxWidth:.infinity).frame(height:50).background(.green.opacity(0.2)).cornerRadius(25)
                   .padding(.horizontal,32)
            }.buttonStyle(MyButtonStyle())

        
            Spacer()
           
            LoadingButton(action: {
                       // Your Action here
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0,execute:{
                    isLoading.toggle()
                })
                   }, isLoading: $isLoading, style: style) {
                       Text("Sign Up").foregroundColor(Color.white)
                   }
        
        }

    }

}



struct SecondSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SecondSwiftUI()
            
            
    }
}


struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? CGFloat(0.85) : 1.0)
            .animation(Animation.spring(response: 0.35, dampingFraction: 0.35), value: configuration.isPressed)
    }
}



class PaddingLabel: UILabel {

    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat

    required init(withInsets top: CGFloat, _ bottom: CGFloat,_ left: CGFloat,_ right: CGFloat) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}

public func showToast(message : String, font: UIFont,duration: TimeInterval) {

    let scenes = UIApplication.shared.connectedScenes
    let windowScene = scenes.first as? UIWindowScene
    let window = windowScene?.windows.first
   
     let toastLabel = PaddingLabel(withInsets: 8, 8, 8, 8)

    let width = (window?.rootViewController?.view.frame.width)! - 45
    let height = window?.rootViewController?.view.frame.height
    toastLabel.frame = CGRect(x: 0, y: height! , width: width, height: 72)
    toastLabel.center.x =  (window?.rootViewController?.view.center.x)!
     toastLabel.lineBreakMode = .byWordWrapping
     toastLabel.numberOfLines = 0
     toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
     toastLabel.textColor = UIColor.white
     toastLabel.font = font
     toastLabel.textAlignment = .center;
     toastLabel.text = message
     toastLabel.alpha = 0.0
     toastLabel.layer.cornerRadius = 18;
     toastLabel.clipsToBounds  =  true
    window?.rootViewController?.view.addSubview(toastLabel)
    
    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        toastLabel.alpha = 1
        toastLabel.transform = toastLabel.transform.translatedBy(x: 0, y: -150)
    }, completion: {isFinished in
        if isFinished {
            UIView.animate(withDuration: 0.5, delay: duration, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                toastLabel.alpha = 0
                toastLabel.transform = toastLabel.transform.translatedBy(x: 0, y: 150)
            }, completion: {isCompleted in
                if isCompleted {
                    toastLabel.removeFromSuperview()
                }
            })
        }
    })

 }

    
