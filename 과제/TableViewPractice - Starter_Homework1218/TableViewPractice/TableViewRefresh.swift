//
//  TableViewRefresh.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    /***************************************************
     UIRefreshControl을 이용해 목록을 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     
     e.g.
     20개 출력 시, 랜덤 숫자의 범위는 0 ~ 70
     40개 출력 시, 랜덤 숫자의 범위는 0 ~ 90
     
     < 참고 >
     (0...10).randomElement()  -  0부터 10사이에 임의의 숫자를 뽑아줌
     ***************************************************/
    
    override var description: String {
        return "Practice 3 - Refresh"
    }
    let tableView = UITableView()
    let maxCnt = 20
    let maxRange = 50
    lazy var data = Array(1...maxCnt)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(reloadData))
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        // 높이값 설정
        tableView.rowHeight = 60
        
        // 리프레쉬 컨트롤
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        
        // add랑 비슷
        tableView.refreshControl = refreshControl
        
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
//        let attrStr = NSAttributedString(
//            string: "Refreshing...",
//            attributes: [.font: UIFont.systemFont(ofSize: 30)]
//        )
//        refreshControl.attributedTitle = attrStr
    }
    
    @objc func reloadData() {
        data.removeAll()
        for _ in 1...maxCnt {
                   data.append(generateRandomNumber())
               }
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
        
       
    }
    
    // 0~70까지 랜덤으로 숫자 하나 리턴
    // 단 data 배열에 없으면 랜덤숫자 리턴, 있으면 다시 난수 생성함수 돌림
    func generateRandomNumber() -> Int {
        #if swift(>=4.2)
        let randomNumber = (0..<maxCnt + maxRange).randomElement()!
        #else
        let randomNumber = Int(arc4random_uniform(UInt32(maxCnt + maxRange)))
        #endif
        guard !data.contains(randomNumber) else { return generateRandomNumber()}
        return randomNumber
    }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\((data[indexPath.row]))"
        return cell
    }
}
