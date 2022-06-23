//
//  ViewController.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 8.04.2022.
//

import UIKit
import Lottie
import SwiftUI

class LaunchScreenController: UIViewController {

    @IBOutlet var myLottieAnim: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
  
        
        myLottieAnim.animation = Animation.named("LottieLaunch")
        myLottieAnim.animationSpeed = 0.5
        myLottieAnim.play(fromProgress: 0, toProgress: 1, loopMode: .repeat(3), completion: {_ in
            print("finished anim")
            let hostingController = UIHostingController(rootView: ExampleSheetsAndAlert().navigationBarHidden(true))
            self.navigationController?.pushViewController(hostingController, animated: true)
           
           
           
            //self.performSegue(withIdentifier: "sequeFromLauncher", sender: nil)
        })
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sequeFromLauncher" {
            let dest = segue.destination as! MainViewController
            dest.modalPresentationStyle = .fullScreen
            dest.modalTransitionStyle = .coverVertical
            present(dest, animated: true, completion: nil)

        }
        
        
    }


}

