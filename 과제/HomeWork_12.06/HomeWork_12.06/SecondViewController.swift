//
//  SecondViewController.swift
//  HomeWork_12.06
//
//  Created by MyMac on 2019/12/09.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    func setUILable() {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        lbl.center = view.center
        lbl.text = "세컨드!"
        view.addSubview(lbl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUILable()
        
        // Do any additional setup after loading the view.
    }
}
