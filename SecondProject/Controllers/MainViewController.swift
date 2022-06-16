//
//  MainViewController.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 8.04.2022.
//

import UIKit
import Alamofire
import PopBounceButton


class MainViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet var showBtn: PopBounceButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingShimmer.startCovering(view, with: nil)
    
        showBtn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
       

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
           // self.dismiss(animated: true, completion: nil)
            LoadingShimmer.stopCovering(self.view)
        })
        
    }
    
    @objc
    func tappedButton(){
        LoadingShimmer.startCovering(showBtn, with: nil)
        
    }


}
