
import UIKit

class BViewController: UIViewController {

    let lblB = UILabel()
    let lblMarkB = UILabel()
    let btnMoveToA = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    func setUpViews() {
        lblMarkB.text = "B 화면입니다!"
        
        lblB.frame.size = CGSize(width: 100, height: 100)
        lblB.center = view.center
        
        lblMarkB.frame = CGRect(x: 175, y: 100, width: 100, height: 50)
        
        btnMoveToA.setTitle("A로 이동", for: .normal)
        btnMoveToA.frame = CGRect(x: 150, y: 500, width: 100, height: 50)
        btnMoveToA.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        view.addSubview(btnMoveToA)
        view.addSubview(lblB)
        view.addSubview(lblMarkB)
       }
    
    @objc private func goBack(_ sender: UIButton) {
           dismiss(animated: false)
       }
    
    override func viewWillAppear(_ animated: Bool) {
        guard  let vc = presentingViewController as? ViewController else {
            return
        }
        let intA = Int(vc.lblA.text!)
        lblB.text = "\(intA! + 1)"
    }

}


