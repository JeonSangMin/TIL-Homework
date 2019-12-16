//
//  ViewController.swift
//  HomeWork_12.06
//
//  Created by MyMac on 2019/12/09.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tf = UITextField()
    
    func setUITextField() {
        tf.frame = CGRect(x: 50, y: 50, width: 200, height: 50)
        tf.center = view.center
        tf.borderStyle = .roundedRect
        tf.placeholder = "아무거나 입력하시오"
        
        
        let btn = UIButton(type: .system)
        btn.setTitle("Move to SecondView", for: .normal)
        btn.frame = CGRect(x: 50, y: 150, width: 300, height: 50)
        btn.addTarget(self, action: #selector(moveToSecond(_:)), for: .touchUpInside)
        
        view.addSubview(tf)
        view.addSubview(btn)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUITextField()
    }
    
    @objc private func moveToSecond(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .formSheet
        present(secondVC, animated: true)
        print(tf.text)
    }
}

