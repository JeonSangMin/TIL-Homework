//
//  ViewController.swift
//  LoginPractice
//
//  Created by MyMac on 2019/12/13.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 로고 부분
    @IBOutlet weak var viewPackage: UIView!
    @IBOutlet weak var redView3: UIView!
    @IBOutlet weak var redView2: UIView!
    @IBOutlet weak var redView1: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    
    // 화면 하단 입력부분
    @IBOutlet weak var viewPack: UIView!
    
    @IBOutlet weak var emailImage: UIImageView!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var emailUnderLIne: UIView!
    @IBOutlet weak var pwImage: UIImageView!
    @IBOutlet weak var pwTf: UITextField!
    @IBOutlet weak var pwUnderLine: UIView!
    
    // 개인정보
    let account = ["qqqq" : "qqqq",
                   "min77@gmail.com" : "1234"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIViews()
        emailTf.delegate = self
        pwTf.delegate = self
        print(UserDefaults.standard.string(forKey: "id"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.emailTf.becomeFirstResponder()
        print("---로그인화면---")
        print(UserDefaults.standard.string(forKey: "id"))
    }
    
    func setUIViews() {
        viewPackage.layer.cornerRadius = viewPackage.frame.width / 4
    }
    
    // 뒤로가기 및 로그아웃
    @IBAction func unwindToFirstView(_ unwindSegue: UIStoryboardSegue) {
        UserDefaults.standard.removeObject(forKey: "id")
        emailTf.text = ""
        pwTf.text = ""
    }
    
    @IBAction func unwindFromSignUp(_ unwindSegue: UIStoryboardSegue) {
    }
    
    // MARK: - 로그인 구현
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard let id = emailTf.text, let pw = pwTf.text else {return false}
        if account[id] == pw{
            // UserDefaults.standard.set(id, forKey: "id")
            return true
        } else {
            // 아이디, 비번 틀리면 로그인 안되고 텍스트 필드 빨갛게 반짝
            UIView.animate(withDuration: 0.3, animations: ({
                self.emailTf.backgroundColor = .red
                self.emailTf.backgroundColor = .none
                
                self.pwTf.backgroundColor = .red
                self.pwTf.backgroundColor = .none
            }))
            return false
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? MainViewController//, let id = emailTf.text
            else {return}
        mainVC.email = UserDefaults.standard.string(forKey: "id") ?? "nil"
    }
    
}


// MARK: - transform 올리기, 내리기
extension ViewController:UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25, animations: ({
            self.viewPack.transform = CGAffineTransform(translationX: 0, y: -130)
        }))
    }
    
    // didEndEditing은 어떤 식이든 수정이 끝나서 텍스트필드에서 포커싱이 해제 된 이후 실행된다.
    
    // 리턴 버튼으로 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // 다른 곳 터치하면 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    // 수정 끝나면 transform 내리기
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.set(emailTf.text, forKey: "id")
        UIView.animate(withDuration: 0.25, animations: ({
            self.viewPack.transform = .identity
        }))
    }
    
    // 글자수 제한 => 16자 이상이면 아예 안써짐
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 16
        
    }
}

