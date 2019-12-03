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
    
    // UIImage 세팅
    let dogImg = UIImage(named: "dog.jpg")
    let catImg = UIImage(named: "cat.jpg")
    let birdImg = UIImage(named: "bird.jpg")
    
    // 전환 횟수 레이블, 변수
    @IBOutlet weak var lblCnt: UILabel!
    var Cnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 레이블 표기 시점 (viewWillAppear)
    override func viewWillAppear(_ animated: Bool) {
        lblCnt.text = String(Cnt) + " 회"
    }
    
    // 세그로 값 넘기기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let SecondVC = segue.destination as? SecondViewController else {return}
        if segue.identifier == "dog" {
            SecondVC.text = "강아지"
            SecondVC.imgName = dogImg
            Cnt += 1
        } else if segue.identifier == "cat" {
            SecondVC.text = "고양이"
            SecondVC.imgName = catImg
            Cnt += 1
        } else {
            SecondVC.text = "새"
            SecondVC.imgName = birdImg
            Cnt += 1
        }
        
    }
    
    // 화면 전환 횟수 제약 걸기
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
    }
    
}

