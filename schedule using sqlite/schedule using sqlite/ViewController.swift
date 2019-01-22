//
//  ViewController.swift
//  schedule using sqlite
//
//  Created by Yuj-admin-mac02 on 11/01/19.
//  Copyright © 2019 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var roomname = [String]()
    var appname = [String]()


    override func viewDidLoad() {
        let selectQuery = "select taskId , taskname from taskTable"
        DBWrapper.sharedObject.SelectAllTask(query: selectQuery)
        roomname = DBWrapper.sharedObject.taskIdArray!
       appname = DBWrapper.sharedObject.tasknameArray!
        print(roomname.count)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(roomname.count)
        return roomname.count
    }
    
    @IBOutlet weak var tableiew: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! TableViewCell
        cell.roomlbl.text = roomname[indexPath.row]
       cell.applbl.text = appname[indexPath.row]
       
        return cell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

