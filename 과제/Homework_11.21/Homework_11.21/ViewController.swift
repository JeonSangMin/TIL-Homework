//
//  ViewController.swift
//  Homework_11.21
//
//  Created by MyMac on 2019/11/21.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnUp: UIButton!
    @IBOutlet weak var btnDown: UIButton!
    @IBOutlet weak var lblNum: UILabel!
    
    var textNum = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNum.text = String(textNum)
        // Do any additional setup after loading the view.
        
    }

    @IBAction func numUp(_ sender: UIButton) {
        textNum += 1
        lblNum.textColor = .blue
        lblNum.text = String(textNum)
    }
    
    @IBAction func numDown(_ sender: UIButton) {
        textNum -= 1
        lblNum.textColor = .red
        lblNum.text = String(textNum)
    }
    

}

