//
//  ViewController.swift
//  progressbar
//
//  Created by Mac on 30/01/2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Network

class ViewController: UIViewController {
let progress = Progress(totalUnitCount: 10)
    override func viewDidLoad() {
       
        progressView.isHidden = true
        super.viewDidLoad()
        progressView.tintColor = UIColor .lightGray
           self.imageview.isHidden = true
    self.progresslabel.isHidden = true
        
        
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
            } else {
                print("There's no internet connection.")
            }
        }
        
        monitor.start(queue: queue)
        
    }
    var flag:Int = 0;
    func rechable()
    {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.pathUpdateHandler = { pathUpdateHandler in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.flag = 1
            } else {
                print("There's no internet connection.")
                self.flag = 0
            }
        }
        
        monitor.start(queue: queue)
    }
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var download: UIButton!
    @IBAction func startcount(_ sender: Any) {

      rechable()
        print("flag ,\(flag)")
        if(flag == 1){
      self.download .setTitle("Downloading...", for:.normal)
        btn()
 
        }
        else
        {
            self.progresslabel.text="plzz"
            self.showSimpleAlert()
            self.rechable()
           
            
        }
    }
    
    
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progresslabel: UILabel!
    func btn()
    {
        
        progressView.isHidden = false
          progressView.tintColor = UIColor .red
        self.download .setTitle("Downloading...", for:.normal)
        
        // 1
        progressView.progress = 0.0
        progress.completedUnitCount = 0
        
        // 2
         self.rechable()
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            if(self.flag == 1){
            
            // 3
            self.progress.completedUnitCount += 1
            self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
            
            self.progresslabel.text = "\(Int(self.progress.fractionCompleted * 100)) %"
            print("print , \(self.progresslabel.text )")
            if(self.progresslabel.text == "100 %")
            {
                self.progresslabel.isHidden=true
                self.progressView.isHidden=true
                self.imageview .isHidden = false
                
                self.download .setTitle("DONE", for:.normal)
                self.download.isEnabled = false
                // self.progressView.isHidden=true
                
                //   button.setImage(UIImage(named:"thumbsUp.png"), for: .normal)
                //button.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
                //   view.addSubview(button)
                
            }
        }
            else
            {
                print("hii")
                timer .invalidate()
              //  self.progresslabel.isHidden = false
               // self.progresslabel.text = "Please check Internet Connection"
                self.showSimpleAlert()
                self.rechable()
                self.btn()
                
            }
        }
   
        }
    func showSimpleAlert() {
        let alert = UIAlertController(title: "Please Check Internet Connection", message: "", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Retry",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        
        }))
        self.present(alert, animated: true, completion: nil)
    }
        
}

