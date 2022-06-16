//
//  CustomAlertController.swift
//  First Project
//
//  Created by Abdullah Kardas on 12.03.2022.
//

import UIKit
import PopBounceButton

class CustomAlertController: UIViewController {
    @IBOutlet var mainView: UIView!
    
    @IBOutlet var imageInfo: UIImageView!
    @IBOutlet var buttonDismiss: PopBounceButton!
    @IBOutlet var buttonOK: PopBounceButton!
    @IBOutlet var dialogText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.layer.cornerRadius = 12
        //mainView.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
    
        dialogText.lineBreakMode = .byWordWrapping
        dialogText.numberOfLines = 0
        let blurFx = UIBlurEffect(style: .dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)
        
        buttonDismiss.springVelocity = 4
        buttonDismiss.springBounciness = 10
        buttonDismiss.springSpeed = 10
        buttonDismiss.longPressScaleFactor = 0.9
        buttonDismiss.addTarget(self, action: #selector(dismissHandle(_:)), for: .touchUpInside)
        buttonOK.springVelocity = 4
        buttonOK.springBounciness = 10
        buttonOK.springSpeed = 10
        buttonOK.longPressScaleFactor = 0.9
        buttonOK.addTarget(self, action: #selector(dismissHandle(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissHandle(_ sender:Any){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.dismiss(animated: false, completion: nil)
        })
        
    }
}
