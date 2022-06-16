//
//  CollectionViewCell.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 9.04.2022.
//

import UIKit
import Lottie

class OnBoardCollectionCell: UICollectionViewCell {
    
    @IBOutlet var myDescribtion: UILabel!
    @IBOutlet var myTitle: UILabel!
    @IBOutlet var myLottie: AnimationView!
    
    func loadData(onBoardingModel:OnBoardingModel){
        
        //SET LOTTİE ANİM
        myLottie.animation = Animation.named(onBoardingModel.lottieAnimName)
        myLottie.animationSpeed = 0.8
        myLottie.loopMode = .loop
        myLottie.play(completion: nil)
        
        myTitle.text = onBoardingModel.title
        myTitle.lineBreakMode = .byWordWrapping
        myTitle.numberOfLines = 0;
       
        myDescribtion.text = onBoardingModel.describtion
        myDescribtion.lineBreakMode = .byWordWrapping
        myDescribtion.numberOfLines = 0;
    }
    
    
}
