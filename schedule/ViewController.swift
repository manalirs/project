//
//  ViewController.swift
//  schedule
//
//  Created by Yuj-admin-mac02 on 10/01/19.
//  Copyright © 2019 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var lbl: UILabel!
        @IBOutlet weak var label: UILabel!
    @IBOutlet var roombuttoms: [UIButton]!
    enum Rooms: String
    {
        case Kitchen = "Kitchen"
        case BedRoom = "BedRoom"
        case Livingroom = "Living Room"
    }
    @IBAction func roomtapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let room = Rooms(rawValue: title)else {
            return
        }
        switch room {
        case .Kitchen:
            print("Kitchen")
            
            label.text = "Kitchen"
            let str = label.text
            print(str!)
        case . Livingroom:
            print("Living Room")
            label.text = "Living Room"
            let str = label.text
            print(str!)
            
        default:
            print("bedroom")
            label.text = "bedroom"
            let str = label.text
            print(str!)

            
      //  roomlbl.text = "bedroom"
        
        }
        

    }
    @IBAction func handleselection(_ sender: UIButton) {
        roombuttoms.forEach{(buttons) in
            buttons.isHidden = !buttons.isHidden

    }
    }
    @IBAction func submit(_ sender: UIButton) {
        let next2 = self.storyboard?.instantiateViewController(withIdentifier: "nextViewController")as!nextViewController
        navigationController?.pushViewController(next2, animated: true)
     /*  if  label.text == "Living Room"
        {let str = label.text
            
            print(str!)
            let defaults = UserDefaults.standard
            defaults.set(str, forKey: "message")
        }
       else{
        print("not done")
        }*/
        if  label.text == "Living Room"
        {
           if lbl.text == "Light"
           {
            let str = label.text
            let str1 = lbl.text
            print(str1!)
            print(str!)
            let defaults = UserDefaults.standard
            defaults.set(str, forKey: "message")
            let defaults1 = UserDefaults.standard
            defaults1.set(str1, forKey: "message1")
            }}
        else{
            print("not done")
        }
        
    }

    enum Appliances: String
    {
        case Ac = "Ac"
        case Fan = "Fan"
        case Light = "Light"
    }

    
    
    
    
    
    @IBOutlet var buttons: [UIButton]!
    @IBAction func handle(_ sender: UIButton) {
        buttons.forEach{(buttons) in
            buttons.isHidden = !buttons.isHidden
        }}

    
    
    @IBAction func apptapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let appliances = Appliances(rawValue: title)else { return}
            switch appliances {
            case .Ac:
                print("Ac")
                lbl.text = "Ac"
                let str = lbl.text
                print(str!)

                
            case . Light:
                lbl.text = "Light"
                let str = lbl.text
                print(str!)

                            //    roomlbl.text = "Living Room"
            default:
                lbl.text = "Fan"
                let str = lbl.text
                print(str!)

                               //  roomlbl.text = "bedroom"
                
            }
            

        
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

