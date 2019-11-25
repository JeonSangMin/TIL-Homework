
import UIKit

class ViewController: UIViewController {

    let lblA = UILabel()
    let lblMarkA = UILabel()
    let btnMoveToB = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        lblA.text = "0"
        lblMarkA.text = "A 화면입니다!"
        
        lblA.frame.size = CGSize(width: 100, height: 100)
        lblA.center = view.center
        
        lblMarkA.frame = CGRect(x: 175, y: 100, width: 100, height: 50)
        
        btnMoveToB.setTitle("B로 이동", for: .normal)
        btnMoveToB.frame = CGRect(x: 150, y: 500, width: 100, height: 50)
        btnMoveToB.addTarget(self, action: #selector(tapTheBtn(_:)), for: .touchUpInside)
        view.addSubview(btnMoveToB)
        view.addSubview(lblA)
        view.addSubview(lblMarkA)
        
    }
    
    @objc private func tapTheBtn(_ sender: UIButton) {
        let BVC = BViewController()
        BVC.modalPresentationStyle = .fullScreen
        present(BVC, animated: false)
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        guard  let bvc = presentedViewController as? BViewController else {
            return
        }
        let intB = Int(bvc.lblB.text!)
        lblA.text = "\(intB! + 1)"
    }


}

