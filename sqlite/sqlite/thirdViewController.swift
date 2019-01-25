//
//  thirdViewController.swift
//  sqlite
//
//  Created by Yuj-admin-mac02 on 18/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    var aarrname:String?
    var aaId:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Taskid.text = aaId
        TaskName.text = aarrname

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Taskid: UITextField!
    @IBOutlet weak var TaskName: UITextField!
    @IBAction func Update(_ sender: UIButton) {
        
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
