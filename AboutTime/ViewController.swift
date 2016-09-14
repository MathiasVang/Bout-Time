//
//  ViewController.swift
//  AboutTime
//
//  Created by Mathias Vang Rasmussen on 14/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let roundInstance = Round()
    var event1Int: Int = 0
    var event2Int: Int = 0
    var event3Int: Int = 0
    var event4Int: Int = 0
    
    var roundsCompleted = 0
    var correctRounds = 0
    
    var buttonOneRoundNumber = 0
    var buttonTwoRoundNumber = 6
    var buttonThirdRoundNumber = 12
    
    var activateMotion: Bool = true
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .motionShake {
            if activateMotion == true {
                checkAnswer()
            }
        }
    }

    
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
    @IBOutlet weak var playAgainBtn: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roundInstance.setupRound()
        populateEventsWithCurrentRound()
        buttonDesign()
        startClock()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func populateEventsWithCurrentRound() {
        playAgainBtn.isHidden = true
        textField.isHidden = true
        
        event1Int = roundInstance.roundNumber
        event2Int = roundInstance.roundNumber + numberOfRounds
        event3Int = roundInstance.roundNumber + numberOfRounds * 2 - 1
        event4Int = roundInstance.roundNumber + numberOfRounds * 3
        
        let event1text = arrayOfRandomEvents[event1Int].eventDescription
        let event2text = arrayOfRandomEvents[event2Int].eventDescription
        let event3text = arrayOfRandomEvents[event3Int].eventDescription
        let event4text = arrayOfRandomEvents[event4Int].eventDescription
        
        firstEventBtn.setTitle(event1text, for: .normal)
        secondEventBtn.setTitle(event2text, for: .normal)
        thirdEventBtn.setTitle(event3text, for: .normal)
        fourthEventBtn.setTitle(event4text, for: .normal)
    }

    // Check if the first answer is highest number
    // Not sure if UIButton is correct. Will it check answer if I press up and down?
    @IBAction func checkAnswer() {
        roundsCompleted += 1
        
        // MARK: Shake Functions
        
        // If firstBtn Int is higher than secondBtn Int etc..... Game is correct else false
        
        // If up and down buttons are changed, the event(number)text need to change.
        
    }
    
    func checkRound() {
        if roundsCompleted == numberOfRounds {
            // Game is over
            displayScore()
        }
    }
    
    func displayScore() {
        hideAllButtons()
        
        // Display play again button and text field
        playAgainBtn.isHidden = false
        textField.isHidden = false
        
        textField.text = "Way to go!\nYou got \(correctRounds) out of \(numberOfRounds) correct!"
    }
    
    // Helper methods
    
    func hideAllButtons() {
        firstEventBtn.isHidden = true
        secondEventBtn.isHidden = true
        thirdEventBtn.isHidden = true
        fourthEventBtn.isHidden = true
        fullUpBtn.isHidden = true
        fullDownBtn.isHidden = true
        halfUpBtnFirst.isHidden = true
        halfUpBtnSecond.isHidden = true
        halfDownBtnFirst.isHidden = true
        halfDownBtnSecond.isHidden = true
        timerLabel.isHidden = true
        descriptionLabel.isHidden = true
        playAgainBtn.isHidden = true
        textField.isHidden = true
    }
    
    func disableButtons() {
        firstEventBtn.isEnabled = false
        secondEventBtn.isEnabled = false
        thirdEventBtn.isEnabled = false
        fourthEventBtn.isEnabled = false
    }
    
    func resetButtons() {
        firstEventBtn.isEnabled = true
        secondEventBtn.isEnabled = true
        thirdEventBtn.isEnabled = true
        fourthEventBtn.isEnabled = true
    }
    
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
        seconds = 60.0
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

