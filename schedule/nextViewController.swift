//
//  nextViewController.swift
//  schedule
//
//  Created by Yuj-admin-mac02 on 10/01/19.
//  Copyright © 2019 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class nextViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var alltaskNames = [String]()
    var allTaskId = [String]()
    var c : Int = 0
     var clickcounter = 0
    
    @IBAction func backbtn(_ sender: UIButton) {
     clickcounter+=1
        clicklbl.text =  ("\(clickcounter)")
        print(("\(clickcounter)"))
                   }
    @IBOutlet weak var clicklbl: UILabel!
    @IBOutlet weak var tableview: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return 1
                   }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         clickcounter+=2
        print(("\(clickcounter)"))

        if indexPath.row == 0
        {

   let cell = tableview.dequeueReusableCell(withIdentifier: "cell")as! TableViewCell
        //cell.roomlbl.text = alltaskNames[indexPath.row]
    cell.roomlbl.text = UserDefaults.standard.value(forKey: "message")as? String
     cell.applbl.text =  UserDefaults.standard.value(forKey: "message1")as? String
       // let cell = tableView.cellForRow(at: indexPath)as! TableViewCell
       
                return cell
        }
       else
      {
        let cell1 = tableview.dequeueReusableCell(withIdentifier: "cell1")as! newTableViewCell
        
        cell1.newlbl1.text = UserDefaults.standard.value(forKey: "message")as? String
        cell1.newlbl2.text =  UserDefaults.standard.value(forKey: "message1")as? String
        return cell1

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
