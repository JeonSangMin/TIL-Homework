//
//  ViewController.swift
//  Homework_11.22
//
//  Created by MyMac on 2019/11/22.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedtxt: UISegmentedControl!
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var lblSegment: UILabel!
    
    
    @IBAction func setLblTxt(_ sender: UISwitch) {
        // onOffSwitch?.isOn = true
        
        if onOffSwitch!.isOn {
            lblOnOff?.text = "On!"
        } else {
            lblOnOff?.text = "Off!"
        }
    }
    @IBAction func setSegLblTxt(_ sender: Any) {
        switch segmentedtxt.selectedSegmentIndex {
        case 0:
            lblSegment.text = segmentedtxt.titleForSegment(at: 0)
        case 1:
            lblSegment.text = segmentedtxt.titleForSegment(at: 1)
        case 2:
            lblSegment.text = segmentedtxt.titleForSegment(at: 2)
        case 3:
            lblSegment.text = segmentedtxt.titleForSegment(at: 3)
        default:
            lblSegment.text = "Select Button"
        }
    }
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

