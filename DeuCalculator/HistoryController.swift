//
//  HistoryController.swift
//  DeuCalculator
//
//  Created by Ferhat KORTAK on 4.04.2020.
//  Copyright © 2020 og. All rights reserved.
//

import UIKit

protocol HistoryControllerDelegate : NSObjectProtocol{
  func clearNow(data: [String])
}

class HistoryController: UIViewController {
  
  weak var delegate : HistoryControllerDelegate?
  var historyList = [String]()
  var empty = [String]()
  
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //navigationController?.hidesBarsOnSwipe = true
    tableView.dataSource = self
    tableView?.layer.borderWidth=2.0;
    tableView.layer.borderColor = UIColor.gray.cgColor
    
  }
  
  @IBAction func clearHistory(_ sender: Any) {
    historyList=[]
    tableView.reloadData()
    if let delegate = delegate{
      delegate.clearNow(data: empty)
    }
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
    cell.textLabel?.textAlignment = .right
    return cell
  }
}

extension HistoryController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("You tapped me!")
  }
}
