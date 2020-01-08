//
//  DelegateViewController.swift
//  HomeWork_GestureRecognizer
//
//  Created by MyMac on 2020/01/08.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {
    var previous: CGPoint?
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var coordinateLbl: UILabel!
    
    var count = 0 {
        didSet {
            countLbl.text = "\(count) 회"
        }
    }
    
    var location = "" {
        didSet {
            coordinateLbl.text = "\(location)"
        }
    }
    
    let gesture = UIGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
}

extension DelegateViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        let touchPoint = touch.location(in: touch.view)
        print(touchPoint)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 0
        
        guard let strX = formatter.string(from: touchPoint.x as NSNumber), let strY = formatter.string(from: touchPoint.y as NSNumber) else {return true}
        location = "x: \(strX), y: \(strY)"
        
        guard let previousPoint =
            previous else {
                previous = touchPoint
                count = 1
                return true
        }
        
        if abs(touchPoint.x - previousPoint.x) > 10 || abs(touchPoint.y - previousPoint.y) > 10 {
            count = 1
            previous = touchPoint
        } else {
            count += 1
        }
        return true
    }
}
