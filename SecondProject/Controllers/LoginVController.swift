//
//  LoginVController.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 10.04.2022.
//

import UIKit
import PasswordTextField




class LoginVController: UIViewController {

    @IBOutlet var textFieldPass: PasswordTextField!
    @IBOutlet var textFieldMail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setGradientBackground()
       
     
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
       // setGradientBackground()
        let colors:[CGColor] = [UIColor.gray.cgColor,UIColorFromRGB(rgbValue: 0x2245b0).cgColor,UIColor.gray.cgColor]
        view.setGradient(colors: colors, angle: 12)
        textFieldMail.layer.cornerRadius = textFieldMail.frame.height/2
        textFieldMail.clipsToBounds = true
        textFieldMail.setLeftPaddingPoints(8)
        textFieldMail.setRightPaddingPoints(8)
    
        textFieldPass.layer.cornerRadius = textFieldPass.frame.height/2
        textFieldPass.clipsToBounds = true
        textFieldPass.setLeftPaddingPoints(8)
        textFieldPass.setRightPaddingPoints(8)
        textFieldPass.showButtonWhile = .Always
        var filled = UIButton.Configuration.filled()
        filled.imagePadding = 5
     
        textFieldPass.secureTextButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
               
      
        //textFieldPass.setRightPaddingPoints(-4)
        super.viewWillAppear(animated)
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

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIView {

    func setGradient(colors: [CGColor], angle: Float = 0) {
        let gradientLayerView: UIView = UIView(frame: CGRect(x:0, y: 0, width: bounds.width, height: bounds.height))
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = gradientLayerView.bounds
        gradient.colors = colors

        let alpha: Float = angle / 360
        let startPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
            2
        )
        let startPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0) / 2)),
            2
        )
        let endPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
            2
        )
        let endPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
            2
        )

        gradient.endPoint = CGPoint(x: CGFloat(endPointX),y: CGFloat(endPointY))
        gradient.startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))

        gradientLayerView.layer.insertSublayer(gradient, at: 0)
        layer.insertSublayer(gradientLayerView.layer, at: 0)
    }

}




