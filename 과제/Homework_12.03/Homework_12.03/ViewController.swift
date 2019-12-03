//
//  ViewController.swift
//  Homework_12.03
//
//  Created by MyMac on 2019/12/03.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dogImg = UIImage(named: "dog.jpg")
    let catImg = UIImage(named: "cat.jpg")
    let birdImg = UIImage(named: "bird.jpg")
    
    @IBOutlet weak var lblCnt: UILabel!
    var Cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblCnt.text = String(Cnt) + " 회"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let SecondVC = segue.destination as? SecondViewController else {return}
        if segue.identifier == "dog" {
            SecondVC.text = "강아지"
            SecondVC.imgName = dogImg
            Cnt += 1
            print(Cnt)
        } else if segue.identifier == "cat" {
            SecondVC.text = "고양이"
            SecondVC.imgName = catImg
            Cnt += 1
            print(Cnt)
        } else {
            SecondVC.text = "새"
            SecondVC.imgName = birdImg
            Cnt += 1
            print(Cnt)
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "dog" && Cnt >= 8 {
            return false
        } else if identifier == "cat" && Cnt >= 10 {
            return false
        } else if identifier == "bird" && Cnt >= 15 {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func unwindToFirtVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        guard let SecondVC = unwindSegue.destination as? SecondViewController else {return}
    }
    
}

