//
//  ViewController.swift
//  CircularProgress
//
//  Created by Mac on 30/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var circularProgress: CircularProgressView!
    @IBAction func btn30(_ sender: Any) {
          circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.30)
        label.text = "30"
    }
    @IBAction func btn60(_ sender: Any) {
        circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.60)
        label.text = "60"
    }
    @IBAction func btn90(_ sender: Any) {
         circularProgress.setProgressWithAnimation(duration: 1.0, value: 0.95)
        label.text = "95"
    }
    override func viewDidLoad() {
        circularProgress.trackClr = UIColor.cyan
        circularProgress.progressClr = UIColor.purple
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

