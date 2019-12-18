//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewMultipleSelection: UIViewController {
    
    /***************************************************
     [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
     
     1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
     2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     (여기까지 TableViewRefresh 실습 내용과 동일)
     3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
     (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
     e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
     4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
     
     < 힌트 키워드 >
     willSelectRowAt - scrollViewDelegate 참고, 선택 가능 여부
     selectedRow(s) - tableView 속성, 현재 선택된 행에 대한 정보
     allowsMultipleSelection - 다중 선택 가능 여부
     ***************************************************/
    
    override var description: String {
        return "Task 1 - MultipleSelection"
    }
    
    let tableView = UITableView()
    let maxCnt = 20
    let maxRange = 50
    lazy var data = Array(1...maxCnt)
    var tempData: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(reloadData))
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
    
        //tableView.selectRow(at: IndexPath.init(row: 2, section: 0), animated: true, scrollPosition: .top)
        
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
        data += tempData
        
        for _ in 1...maxCnt {
            data.append(generateRandomNumber())
        }
        
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
        tempData.removeAll()
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

extension TableViewMultipleSelection: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\((data[indexPath.row]))"
        return cell
    }
}

extension TableViewMultipleSelection: UITableViewDelegate {
    
    
    // 선택 가능 여부, 7보다 작으면 선택 안됨
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        tableView.allowsMultipleSelection = true
        let temp = data[indexPath.row]
        if temp <= 7 {
        return nil
        } else {
        tempData.append(data[indexPath.row])
        print("선택 된 값은 \(tempData) 입니다")
        return indexPath
        }
    }
}
