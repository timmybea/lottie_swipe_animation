//
//  ViewController.swift
//  Lottie_swipe_animation
//
//  Created by Tim Beals on 2017-02-26.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController, UIScrollViewDelegate {

    
    let stringArray = ["<- Swipe to begin", "Get out of bed", "Don't forget to clean.", "Use water...", "...then eat TOAST", "...and go to work"]
    
    let animationView: LOTAnimationView = {
        let view = LOTAnimationView.animationNamed("tutorial")
        view?.backgroundColor = UIColor.white
        view?.loopAnimation = true
        view?.contentMode = .scaleAspectFill
        return view!
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.isPagingEnabled = true
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Animation"
        view.backgroundColor = UIColor.white
        
        self.view.addSubview(animationView)
        self.view.addSubview(scrollView)
        
        animationView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 300)
        scrollView.frame = self.view.frame

//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(recognizer:)))
//        self.view.addGestureRecognizer(panGesture)
        
        setupScrollView()
        
    }

    
    func setupScrollView() {
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.width * 6, height: view.frame.height)
        
        for (i, string) in stringArray.enumerated() {
            
            let label = UILabel()
            label.frame = CGRect(x: scrollView.center.x + (CGFloat(i) * scrollView.frame.width) - CGFloat(130), y: scrollView.frame.height * CGFloat(0.75), width: 260, height: 50)
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.text = string
            label.textAlignment = .center
            scrollView.addSubview(label)
            
        }
    }
    
//    func handlePan(recognizer: UIPanGestureRecognizer) {
//        
//        let translation = recognizer.translation(in: self.view)
//        let progress = translation.x / self.view.bounds.width
//        
//        animationView.animationProgress = progress
//    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let progress = scrollView.contentOffset.x / scrollView.contentSize.width
        animationView.animationProgress = progress
    }
}

