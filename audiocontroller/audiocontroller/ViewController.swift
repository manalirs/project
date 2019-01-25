//
//  ViewController.swift
//  audiocontroller
//
//  Created by Yuj-admin-mac02 on 11/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player:AVAudioPlayer?
    var timer:Timer?
    

    @IBAction func start(_ sender: UIBarButtonItem) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeTime), userInfo: nil, repeats: true)
        timer?.fire()
        player?.play()

    }
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func slideract(_ sender: UISlider) {
        player?.volume = slider1.value
    }
        @IBAction func pause(_ sender: UIBarButtonItem) {
        timer?.invalidate()
        player?.pause()
    }
    
    @IBAction func stop(_ sender: UIBarButtonItem) {
        slider.value = 0
        player?.currentTime = TimeInterval(slider.value)
        timer?.invalidate()
        player?.stop()

    }
    func changeTime()
    {
        slider.value += 1
        player?.currentTime = TimeInterval(slider.value)
        
        
    }

    override func viewDidLoad() {
        let path = Bundle.main.path(forResource: "song", ofType: ".mp3")
        let url = URL(string: path!)
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
            
            
        }
        catch
        {
            print(error.localizedDescription)
        }
        slider.minimumValue = 0
        slider.maximumValue = Float((player?.duration)!)
    
        
 
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

