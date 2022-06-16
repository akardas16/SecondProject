//
//  OnBoardingControllerView.swift
//  SecondProject
//
//  Created by Abdullah Kardas on 9.04.2022.
//

import UIKit
import PopBounceButton

class OnBoardingControllerView: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var pageConroller: UIPageControl!
    @IBOutlet var nextBtn: PopBounceButton!
    var currentPage = 0 {
        didSet {
            pageConroller.currentPage = currentPage
            if currentPage == myList.count - 1 {
                nextBtn.setTitle("Lets Start", for: .normal)
            }else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    var myList:[OnBoardingModel] = []
    var onb1 = OnBoardingModel(title: "Standard Onboarding", describtion: "You can also combine different onboarding types to create new ones, like a 'delayed, conditional' onboarding.", lottieAnimName: "LottieLaunch")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myList.append(onb1)
        myList.append(onb1)
        myList.append(onb1)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        pageConroller.currentPage = currentPage
        pageConroller.numberOfPages = myList.count
        
        nextBtn.addTarget(self, action: #selector(tappedNext), for: .touchUpInside)
      

        // Do any additional setup after loading the view.
    }
    
    @objc
    func tappedNext(){
        if currentPage == myList.count - 1 {
            //You are on last page
            showToast(message: "You are on last Page", font: .systemFont(ofSize: 16), duration: 3)
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            myCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        myList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewIdentifier", for: indexPath) as! OnBoardCollectionCell
        
        cell.loadData(onBoardingModel: myList[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
       
    }
    
    public func showToast(message : String, font: UIFont, duration: TimeInterval) {

            let toastLabel = PaddingLabel(withInsets: 8, 8, 8, 8)
           toastLabel.frame = CGRect(x: 0, y: self.view.frame.size.height, width: (self.view.frame.width - 48), height: 72)
            toastLabel.center.x = view.center.x
            toastLabel.lineBreakMode = .byWordWrapping
            toastLabel.numberOfLines = 0
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 0.0
            toastLabel.layer.cornerRadius = 18;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
           
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
    
    // class
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
}

