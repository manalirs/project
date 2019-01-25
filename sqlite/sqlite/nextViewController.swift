//
//  nextViewController.swift
//  sqlite
//
//  Created by Yuj-admin-mac02 on 18/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    @IBOutlet weak var taskname: UITextField!
    @IBOutlet weak var taskid: UITextField!
    
    @IBAction func savebtn(_ sender: UIButton) {
        let insertQuery = "Insert into taskTable(taskId,taskName) values('\(taskid.text!)','\(taskname.text!)')"
        let isSuccess = DBWrapper.sharedObject.executeQuery(query: insertQuery)
        if isSuccess
        {
            print("insert : Success")
        }
        else
        {
            print("insert : failed")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
