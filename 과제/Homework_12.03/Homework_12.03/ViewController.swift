//
//  ViewController.swift
//  Homework_12.03
//
//  Created by MyMac on 2019/12/03.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

// 클래스명은 바꾸겠는데 파일명을 못바꾸겠습니다 ㅜㅜ 그래도 실행은 잘 됩니다.
class FirstViewController: UIViewController {
    

    // 전환 횟수 레이블, 변수
    @IBOutlet weak var lblCnt: UILabel!
    var dogCnt = 0
    var catCnt = 0
    var birdCnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 레이블 표기 시점 (viewWillAppear)
    override func viewWillAppear(_ animated: Bool) {
        lblCnt.text = String("🐶 : \(dogCnt) | 🐱 : \(catCnt) | 🐧 : \(birdCnt)")
    }
    
    // 세그로 값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let SecondVC = segue.destination as? SecondViewController else {return}
        if segue.identifier == "dog" {
            SecondVC.text = "강아지"
            SecondVC.imageURL = "dog.jpg"
            dogCnt += 1
        } else if segue.identifier == "cat" {
            SecondVC.text = "고양이"
            SecondVC.imageURL = "cat.jpg"
            catCnt += 1
        } else {
            SecondVC.text = "새"
            SecondVC.imageURL = "bird.jpg"
            birdCnt += 1
        }
        
    }
    
    // 화면 전환 횟수 제약 걸기
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "dog" && dogCnt >= 3 {
            return false
        } else if identifier == "cat" && catCnt >= 5 {
            return false
        } else if identifier == "bird" && birdCnt >= 7 {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func unwindToFirtVC(_ unwindSegue: UIStoryboardSegue) {
    }
    
}

