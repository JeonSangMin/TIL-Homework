//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  x 부터  y 사이에 임의의 숫자
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ***************************************************/
    
    override var description: String { "Practice 2 - Section" }
    
    let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    
    var numDict: [Int : [Int]] = [:]
    
    //let data = Array(1...100)
    lazy var numDictSection: [Int] = numDict.keys.sorted()
    
    func generateNum() {
        for i in data {
            let key = i/10
            
            if numDict[key] == nil {
                numDict[key] = [i]
            } else {
                numDict[key]!.append(i)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        generateNum()
    }
}

//MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numDict.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "\(numDictSection[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numDict[numDictSection[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let datas = numDict[numDictSection[indexPath.section]]!
        cell.textLabel?.text = "\(datas[indexPath.row])"
        return cell
    }
}
