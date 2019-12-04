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
    var text = ""
    var imageURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAnimal.text = text
        image.image = UIImage(named: imageURL)
    }
    
    @IBAction func plusCnts(_ sender: UIButton) {
        guard let vc = presentingViewController as? FirstViewController else {return}
        vc.dogCnt < 3 ? vc.dogCnt += 1 : ()
        vc.catCnt < 5 ? vc.catCnt += 1 : ()
        vc.birdCnt < 7 ? vc.birdCnt += 1 : ()
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
