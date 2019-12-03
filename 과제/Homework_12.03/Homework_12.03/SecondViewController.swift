//
//  SecondViewController.swift
//  Homework_12.03
//
//  Created by MyMac on 2019/12/03.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblAnimal: UILabel!
    @IBOutlet weak var image: UIImageView!
    //var plusCnt = 0
    var text = ""
    var imgName = UIImage(named: "dog")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAnimal.text = text
        image.image = imgName
    }
    
    @IBAction func plusCnts(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else {return}
        vc.Cnt += 1
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
