//
//  ViewController.swift
//  HomeWork_GestureRecognizer
//
//  Created by MyMac on 2020/01/07.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var coodinateLbl: UILabel!
    
    var count = 0 {
        didSet {
            countLbl.text = "\(count) 회"
        }
    }
    
    var location = "" {
        didSet {
            coodinateLbl.text = "\(location)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var lastPoint: CGPoint?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let touchPoint = touch.location(in: touch.view)
        let locationX = touchPoint.x
        let locationY = touchPoint.y
        
        let formetter = NumberFormatter()
        formetter.maximumFractionDigits = 1
        formetter.minimumFractionDigits = 0
        guard let textX = formetter.string(from: locationX as NSNumber) else {return}
        guard let textY = formetter.string(from: locationY as NSNumber) else {return}
        location = "x: \(textX), y: \(textY)"
        
        guard let first = lastPoint else {
            lastPoint = touchPoint
            count = 1
            return
        }
        
        if  abs(locationX - first.x) > 10 || abs(locationY - first.y) > 10 {
            count = 1
            lastPoint = touchPoint
        } else {
            count += 1
        }
    }
}

