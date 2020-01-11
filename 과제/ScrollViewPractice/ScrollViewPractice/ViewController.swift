//
//  ViewController.swift
//  ScrollViewPractice
//
//  Created by MyMac on 2020/01/10.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }

//    private func setPageControl() {
//        scrollView.isPagingEnabled = true
//        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 4, height: UIScreen.main.bounds.height)
//        scrollView.alwaysBounceVertical = false
//        pageControl.isUserInteractionEnabled = false
//    }
//
}

extension ViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}

