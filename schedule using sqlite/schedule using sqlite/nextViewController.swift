//
//  nextViewController.swift
//  schedule using sqlite
//
//  Created by Yuj-admin-mac02 on 11/01/19.
//  Copyright © 2019 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var label: UILabel!
    enum Rooms: String
    {
        case Kitchen = "Kitchen"
        case BedRoom = "BedRoom"
        case Livingroom = "Living Room"
    }
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var textfield2: UITextField!

    @IBAction func savebtn(_ sender: UIButton) {
        let insertQuery = "Insert into taskTable(taskId,taskname) values('\(textfield.text!)','\(textfield2.text)')"
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

    @IBAction func btntapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let room = Rooms(rawValue: title)else {
            return
        }
        switch room {
        case .Kitchen:
            print("Kitchen")
            
            label.text = "Kitchen"
            let str = label.text
            print(str!)
            textfield.text = label.text
        case . Livingroom:
            print("Living Room")
            label.text = "Living Room"
            let str = label.text
            print(str!)
            textfield.text = label.text

            
        default:
            print("BedRoom")
            label.text = "BedRoom"
            let str = label.text
            print(str!)
            textfield.text = label.text

            

        }}

    @IBOutlet var roombuttons: [UIButton]!
    @IBAction func handleselection(_ sender: UIButton) {
        roombuttons.forEach{(buttons) in
            buttons.isHidden = !buttons.isHidden
            
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    enum Appliances: String
    {
        case Ac = "Ac"
        case Light = "Light"
        case Fan = "Fan"
    }
   
    @IBAction func tapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let room = Appliances(rawValue: title)else {
            return
        }
        switch room {
        case .Ac:
            print("Ac")
            
            label.text = "Ac"
            let str = label.text
            print(str!)
            textfield2.text = label.text
        case . Light:
            print("Light")
            label.text = "Light"
            let str = label.text
            print(str!)
            textfield2.text = label.text
            
            
        default:
            print("Fan")
            label.text = "Fan"
            let str = label.text
            print(str!)
            textfield2.text = label.text
            
            
            
        }

    }
    
    @IBAction func handleappliances(_ sender: UIButton) {
        acbtns.forEach{(buttons) in
            buttons.isHidden = !buttons.isHidden
            
        }
    }
   
    @IBOutlet var acbtns: [UIButton]!

   
    }





    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


