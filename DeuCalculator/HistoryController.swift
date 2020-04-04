//
//  HistoryController.swift
//  DeuCalculator
//
//  Created by Ferhat KORTAK on 4.04.2020.
//  Copyright © 2020 og. All rights reserved.
//

import UIKit

class HistoryController: UIViewController {

    var historyList = [String]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("loaded")
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension HistoryController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let history = historyList[indexPath.row]
        
        cell.textLabel?.text = history
        return cell
    }
    
    
}

extension HistoryController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
}
