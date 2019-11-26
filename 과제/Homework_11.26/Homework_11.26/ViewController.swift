//
//  ViewController.swift
//  Homework_11.26
//
//  Created by MyMac on 2019/11/26.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func editingChanged(_ sender: UITextField) {
        lblText.text = sender.text!
    }
    
    @IBAction func textFieldDidBegin(_ sender: UITextField) {
        lblText.textColor = .blue
        lblText.font = lblText.font.withSize(40)
    }
        
    @IBAction func textFieldDidOnExit(_ sender: UITextField) {
        lblText.textColor = .red
        lblText.font = lblText.font.withSize(20)
    }
    
    
}

