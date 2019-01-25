//
//  ViewController.swift
//  calculator
//
//  Created by Yuj-admin-mac02 on 26/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0;
    var pn:Double = 0
    var performingMath = false
    var operation = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btn(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
             pn = Double(label.text!)!
            if sender.tag == 12
            {
                label.text = "/"

            }
           else if sender.tag == 13
            {
                label.text = "*"

            }
           else if sender.tag == 14
            {
                label.text = "-"

            }
           else if sender.tag == 15
            {
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
         else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(pn / numberOnScreen)
            }
            else if operation == 13
            {
                label.text = String(pn * numberOnScreen)
            }
          else  if operation == 14
            {
                label.text = String(pn - numberOnScreen)
            }
          else  if operation == 15
            {
                label.text = String(pn + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            pn = 0
            numberOnScreen = 0
            operation = 0
            label.text = "0"
        }
        
    }

    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
            
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            

        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

