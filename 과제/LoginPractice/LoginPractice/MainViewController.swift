//
//  MainViewController.swift
//  LoginPractice
//
//  Created by MyMac on 2019/12/13.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var emailIndicator: UILabel!
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailIndicator.text = UserDefaults.standard.string(forKey: "id")
    }
    
    @IBAction func signOutBtn(_ sender: UIButton) {
        //var window: UIWindow?
        let board = UIStoryboard(name: "Main", bundle: nil)
         let vc = board.instantiateViewController(withIdentifier:"FirstVC")
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let sceneDelegate = windowScene.delegate as? SceneDelegate
                window.rootViewController = vc
                sceneDelegate?.window = window
                window.makeKeyAndVisible()
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("---메인화면---")
        print(UserDefaults.standard.string(forKey: "id"))
    }
    
    @IBAction func removeAndgoFirst(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "id")
        print(UserDefaults.standard.string(forKey: "id"))
    }
}
