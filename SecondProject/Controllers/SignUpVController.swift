//
//  SignUpVController.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 12.04.2022.
//

import UIKit
import FirebaseAuth
import PasswordTextField


class SignUpVController: UIViewController {

    @IBOutlet var PasswordConfirmField: PasswordTextField!
    @IBOutlet var passwordField: PasswordTextField!
    @IBOutlet var mailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       // signUpUser(mail: "akardas16@gmail.com", password: "12345678")
        
        // Customize your comet
        let width = view.bounds.width
        let height = view.bounds.height
        
       
        let comets = [Comet(startPoint: CGPoint(x: 0, y: 60),
                            endPoint: CGPoint(x: 150, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),Comet(startPoint: CGPoint(x: 100, y: 0),
                            endPoint: CGPoint(x: 0, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),Comet(startPoint: CGPoint(x: 150, y: 60),
                            endPoint: CGPoint(x: 20, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),Comet(startPoint: CGPoint(x: 100, y: 0),
                            endPoint: CGPoint(x: 0, y: 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.4 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.8 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0.8 * width, y: 0),
                            endPoint: CGPoint(x: width, y: 0.2 * width),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width, y: 0.2 * height),
                            endPoint: CGPoint(x: 0, y: 0.25 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                            endPoint: CGPoint(x: 0.6 * width, y: height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: width - 100, y: height),
                            endPoint: CGPoint(x: width, y: height - 100),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white),
                      Comet(startPoint: CGPoint(x: 0, y: 0.8 * height),
                            endPoint: CGPoint(x: width, y: 0.75 * height),
                            lineColor: UIColor.white.withAlphaComponent(0.2),
                            cometColor: UIColor.white)]

        // draw line track and animate
        for comet in comets {
            
            view.layer.addSublayer(comet.drawLine())
            view.layer.addSublayer(comet.animate())
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let colors:[CGColor] = [UIColor.gray.cgColor,UIColorFromRGB(rgbValue: 0x2245b0).cgColor,UIColor.gray.cgColor]
        view.setGradient(colors: colors, angle: 12)
        mailField.layer.cornerRadius = mailField.frame.height/2
        mailField.clipsToBounds = true
        mailField.setLeftPaddingPoints(8)
        mailField.setRightPaddingPoints(8)
    
        passwordField.layer.cornerRadius = passwordField.frame.height/2
        passwordField.clipsToBounds = true
        passwordField.setLeftPaddingPoints(8)
        passwordField.setRightPaddingPoints(8)
        passwordField.showButtonWhile = .Always
     
        passwordField.secureTextButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        
        PasswordConfirmField.layer.cornerRadius = PasswordConfirmField.frame.height/2
        PasswordConfirmField.clipsToBounds = true
        PasswordConfirmField.setLeftPaddingPoints(8)
        PasswordConfirmField.setRightPaddingPoints(8)
        PasswordConfirmField.showButtonWhile = .Always
     
        PasswordConfirmField.secureTextButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
               
      
        //textFieldPass.setRightPaddingPoints(-4)
        super.viewWillAppear(animated)
    }
    

    func signUpUser(mail:String,password:String){
        Auth.auth().createUser(withEmail: mail, password: password, completion: {authResult, error in
            guard let user = authResult?.user, error == nil else {
                print("error happened: \(String(describing: error?.localizedDescription))")
                return}
                          print("\(user.email!) created****")
        })
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
