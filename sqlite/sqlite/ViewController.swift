//
//  ViewController.swift
//  sqlite
//
//  Created by Yuj-admin-mac02 on 12/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var taskidlbl: UILabel!
    var alltaskNames = [String]()
    var allTaskId = [String]()
    var c : Int = 0
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print(allTaskId.count)
        return allTaskId.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)as! TableViewCell
    let str = cell.taskidlbl.text
        let str1 = cell.tasknamelbl.text
        let next1 = self.storyboard?.instantiateViewController(withIdentifier: "thirdViewController")as! thirdViewController
        navigationController?.pushViewController(next1, animated: true)
        next1.aarrname = str
        next1.aaId = str1
    }
    @IBOutlet weak var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! TableViewCell
        cell.tasknamelbl.text = alltaskNames[indexPath.row]
        cell.taskidlbl.text = allTaskId[indexPath.row]
        return cell
    }
    
    @IBAction func nextbtn(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController")as! nextViewController
        navigationController?.pushViewController(next, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let selectQuery = "select taskID, taskName from taskTable"
        DBWrapper.sharedObject.SelectAllTask(query: selectQuery)
        alltaskNames = DBWrapper.sharedObject.taskNameArray!
        allTaskId = DBWrapper.sharedObject.taskIdArray!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

