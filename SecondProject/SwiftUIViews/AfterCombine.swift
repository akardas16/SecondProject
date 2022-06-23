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
import PanModal

class MyViewModel:ObservableObject{
    @Published var textField:String = ""
    @Published var countText:Int = 0
    @Published var color:Color = Color.green
   
    private var cancelAll:Set<AnyCancellable> = []
    
    init() {
        primeSubscriber()
    }
    
    func primeSubscriber(){
        $textField
            .map {$0.count}
            .sink{[unowned self]  in
                self.countText = $0
            }.store(in: &cancelAll)
        
        $countText
            .map{$0 > 10 ? Color.red:Color.green}
            .sink { [unowned self] in
                self.color = $0
            }.store(in: &cancelAll)
        
            
    }
   
    func cancelAllSubscriber(){
        cancelAll.removeAll()
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

struct Person:Identifiable{
    let id:UUID = UUID()
    var name:String
    var age:Int
}
struct AfterCombine: View {
    @StateObject var vm = MyViewModel()
    @State var text:String = ""
   
    
    var body: some View {
        NavigationView{
        
            VStack{
             
                Text(text)
                TextField("type something...", text: $text).frame(maxWidth: .infinity).padding().background {
                    Capsule(style: .continuous).fill(.gray.opacity(0.3))
                }.padding()
                UITextFieldRepresent(text: $text, color: Color.cyan).frame(maxWidth: .infinity).frame(height: 52).background {
                    Capsule(style: .continuous).fill(.gray.opacity(0.3))
                }.padding()
                
            }.navigationBarHidden(true)
          
        }
       
    }
    
  
}

struct AfterCombine_Previews: PreviewProvider {
    static var previews: some View {
        AfterCombine()
    }
}
struct UITextFieldRepresent:UIViewRepresentable {
    typealias UIViewType = UITextField
    @Binding var text:String
    var color:Color
    
    func makeUIView(context: Context) -> UITextField {
        let txtField = getTextField()
        txtField.textColor = UIColor(color)
        txtField.delegate = context.coordinator
        return txtField
    }
    //send data from SwfitUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: "type anything...", attributes: [.foregroundColor: UIColor.red.withAlphaComponent(0.3)])
        textField.setLeftPaddingPoints(16)
        textField.setRightPaddingPoints(16)
        //textField.textColor = UIColor.green
       
        return textField
    }
    //send data from UIKit to SwiftUI
    func makeCoordinator() -> cordinatorDelegate {
        return cordinatorDelegate(text: $text)
    }
    class cordinatorDelegate:NSObject,UITextFieldDelegate {
        @Binding var text:String
        init(text: Binding<String>) {
            self._text = text
        }
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
   
    
    
}

struct SwiftUIViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
  
    
}




