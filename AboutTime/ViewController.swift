//
//  ViewController.swift
//  AboutTime
//
//  Created by Mathias Vang Rasmussen on 14/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var roundsCompleted = 0

    
    @IBOutlet weak var firstEventBtn: UIButton!
    @IBOutlet weak var secondEventBtn: UIButton!
    @IBOutlet weak var thirdEventBtn: UIButton!
    @IBOutlet weak var fourthEventBtn: UIButton!
    @IBOutlet weak var fullDownBtn: UIButton!
    @IBOutlet weak var fullUpBtn: UIButton!
    @IBOutlet weak var halfUpBtnFirst: UIButton!
    @IBOutlet weak var halfUpBtnSecond: UIButton!
    @IBOutlet weak var halfDownBtnFirst: UIButton!
    @IBOutlet weak var halfDownBtnSecond: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonDesign()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    // Helper Methods
    func buttonDesign() {
        firstEventBtn.layer.cornerRadius = 5
        secondEventBtn.layer.cornerRadius = 5
        thirdEventBtn.layer.cornerRadius = 5
        fourthEventBtn.layer.cornerRadius = 5
    }
    
    
    // Timer function
    var seconds = 0.0
    var timer = Timer()
    
    func startClock() {
        timerLabel.textColor = UIColor(red: 225/225, green: 225/225, blue: 225/225, alpha: 1.0)
        seconds = 15.0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.subtractTime), userInfo: nil, repeats: true)
    }
    
    @objc func subtractTime() {
        seconds -= 0.1
        timerLabel.text = "Time left: \(String(format: "%.01f", seconds))"
        
        if seconds <= 0.0 {
            timer.invalidate()
            timerLabel.text = "Time left: 0.0"
            roundsCompleted += 1
        } else if seconds < 5 {
            timerLabel.textColor = UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0)
            timerLabel.text = "HURRY! \n" + "Time left: \(String(format: "%01f", seconds))"
        }
    }
}

