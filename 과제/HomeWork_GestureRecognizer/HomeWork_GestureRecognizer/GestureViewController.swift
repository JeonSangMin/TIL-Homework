//
//  GestureViewController.swift
//  HomeWork_GestureRecognizer
//
//  Created by MyMac on 2020/01/08.
//  Copyright © 2020 sandMan. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        guard sender.state == .ended else { return }
        let touchPoint = sender.location(in: sender.view)
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 0
        
        guard let strX = formatter.string(from: touchPoint.x as NSNumber), let strY = formatter.string(from: touchPoint.y as NSNumber) else {return}
        location = "x: \(strX), y: \(strY)"
        
        guard let previousPoint =
            previous else {
                previous = touchPoint
                count = 1
                return
        }
        
        if abs(touchPoint.x - previousPoint.x) > 10 || abs(touchPoint.y - previousPoint.y) > 10 {
            count = 1
            previous = touchPoint
        } else {
            count += 1
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
