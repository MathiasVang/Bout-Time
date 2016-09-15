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
    
    var correctRounds = 0
    
    var activateMotion: Bool = true
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(motion == UIEventSubtype.motionShake) {
            checkAnswer()
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
    @IBOutlet weak var nextRound: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roundInstance.setupRound()
        populateEventsWithCurrentRound()
        buttonDesign()
        aligningButtonText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func aligningButtonText() {
        firstEventBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        secondEventBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        thirdEventBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        fourthEventBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
    }
    
    
    func populateEventsWithCurrentRound() {
        
        
        startClock()
        
        playAgainBtn.isHidden = true
        textField.isHidden = true
        nextRound.isHidden = true
        
        timerLabel.isHidden = false
        descriptionLabel.isHidden = false
        firstEventBtn.isHidden = false
        secondEventBtn.isHidden = false
        thirdEventBtn.isHidden = false
        fourthEventBtn.isHidden = false
        fullDownBtn.isHidden = false
        halfUpBtnFirst.isHidden = false
        halfDownBtnFirst.isHidden = false
        halfUpBtnSecond.isHidden = false
        halfDownBtnSecond.isHidden = false
        fullUpBtn.isHidden = false
        
        fullDownBtn.isEnabled = true
        halfUpBtnFirst.isEnabled = true
        halfDownBtnFirst.isEnabled = true
        halfUpBtnSecond.isEnabled = true
        halfDownBtnSecond.isEnabled = true
        fullUpBtn.isEnabled = true
        
        
        
        disableButtons()
        
        descriptionLabel.text = "Shake to complete"
        
        event1Int = roundInstance.roundNumber
        event2Int = roundInstance.roundNumber + numberOfRounds
        event3Int = roundInstance.roundNumber + numberOfRounds * 2 - 1
        event4Int = roundInstance.roundNumber + numberOfRounds * 3
        
        firstEventBtn.setTitle(arrayOfRandomEvents[event1Int].eventDescription, for: .normal)
        secondEventBtn.setTitle(arrayOfRandomEvents[event2Int].eventDescription, for: .normal)
        thirdEventBtn.setTitle(arrayOfRandomEvents[event3Int].eventDescription, for: .normal)
        fourthEventBtn.setTitle(arrayOfRandomEvents[event4Int].eventDescription, for: .normal)
    }
    
    // Make logic for buttons
    
    @IBAction func fullDownBtn(_ sender: AnyObject) {
        
        fullDownBtn.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
        
        swap(&arrayOfRandomEvents[event1Int], &arrayOfRandomEvents[event2Int])
        
        firstEventBtn.setTitle(arrayOfRandomEvents[event1Int].eventDescription, for: .normal)
        secondEventBtn.setTitle(arrayOfRandomEvents[event2Int].eventDescription, for: .normal)
    }

    @IBAction func halfUpBtn1(_ sender: AnyObject) {
        
        halfUpBtnFirst.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        
        swap(&arrayOfRandomEvents[event2Int], &arrayOfRandomEvents[event1Int])
        
        firstEventBtn.setTitle(arrayOfRandomEvents[event1Int].eventDescription, for: .normal)
        secondEventBtn.setTitle(arrayOfRandomEvents[event2Int].eventDescription, for: .normal)
    }

    @IBAction func halfDownBtn1(_ sender: AnyObject) {
        
        halfDownBtnFirst.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        
        swap(&arrayOfRandomEvents[event2Int], &arrayOfRandomEvents[event3Int])
        
        secondEventBtn.setTitle(arrayOfRandomEvents[event2Int].eventDescription, for: .normal)
        thirdEventBtn.setTitle(arrayOfRandomEvents[event3Int].eventDescription, for: .normal)
    }

    @IBAction func halfUpBtn2(_ sender: AnyObject) {
        
        halfUpBtnSecond.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        
        swap(&arrayOfRandomEvents[event3Int], &arrayOfRandomEvents[event2Int])
        
        secondEventBtn.setTitle(arrayOfRandomEvents[event2Int].eventDescription, for: .normal)
        thirdEventBtn.setTitle(arrayOfRandomEvents[event3Int].eventDescription, for: .normal)
    }
    
    @IBAction func halfDownBtn2(_ sender: AnyObject) {
        
        halfDownBtnSecond.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        
        swap(&arrayOfRandomEvents[event3Int], &arrayOfRandomEvents[event4Int])
        
        thirdEventBtn.setTitle(arrayOfRandomEvents[event3Int].eventDescription, for: .normal)
        fourthEventBtn.setTitle(arrayOfRandomEvents[event4Int].eventDescription, for: .normal)
    }
    
    @IBAction func fullUpBtn(_ sender: AnyObject) {
        
        fullUpBtn.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
        
        swap(&arrayOfRandomEvents[event4Int], &arrayOfRandomEvents[event3Int])
        
        thirdEventBtn.setTitle(arrayOfRandomEvents[event3Int].eventDescription, for: .normal)
        fourthEventBtn.setTitle(arrayOfRandomEvents[event4Int].eventDescription, for: .normal)
    }
    
    func correctAnswer() {
        nextRound.setBackgroundImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
        correctRounds += 1
    }
    
    func wrongAnswer() {
        nextRound.setBackgroundImage(#imageLiteral(resourceName: "next_round_fail"), for: .normal)
    }
    
    //func setColorsFourButtons() {
      //  firstEventBtn.setTitleColor(<#T##color: UIColor?##UIColor?#>, for: <#T##UIControlState#>)
    //}
    
    // Check if the first answer is highest number
    func checkAnswer() {
        
        timer.invalidate()
        
        fullDownBtn.isEnabled = false
        halfUpBtnFirst.isEnabled = false
        halfDownBtnFirst.isEnabled = false
        halfUpBtnSecond.isEnabled = false
        halfDownBtnSecond.isEnabled = false
        fullUpBtn.isEnabled = false
        
        timerLabel.isHidden = true
        resetButtons()
        descriptionLabel.text = "Tap events to learn more"
        
        nextRound.isHidden = false
        
        roundInstance.roundNumber += 1
        
        if arrayOfRandomEvents[event1Int].eventYear > arrayOfRandomEvents[event2Int].eventYear &&
            arrayOfRandomEvents[event2Int].eventYear > arrayOfRandomEvents[event3Int].eventYear &&
            arrayOfRandomEvents[event3Int].eventYear > arrayOfRandomEvents[event4Int].eventYear {
            correctAnswer()
        } else {
            wrongAnswer()
        }
        
        checkRound()
    }
    

    @IBAction func nextRound(_ sender: AnyObject) {
        populateEventsWithCurrentRound()
        
    }
    
    func checkRound() {
        if roundInstance.roundNumber == numberOfRounds {
            // Game is over
            displayScore()
        }
    }
    
    func displayScore() {
        hideAllButtons()
        
        // Display play again button and text field
        playAgainBtn.isHidden = false
        textField.isHidden = false
        
        textField.text = "You got \(correctRounds) out of \(numberOfRounds) correct!"
    }
    
    @IBAction func playAgain(_ sender: AnyObject) {
        roundInstance.resetRound()
        roundInstance.setupRound()
        populateEventsWithCurrentRound()
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
        nextRound.isHidden = true
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
        
        firstEventBtn.setTitleColor(UIColor(red: 43/255.0, green: 140/255.0, blue: 251/255.0, alpha: 1.0), for: .disabled)
        secondEventBtn.setTitleColor(UIColor(red: 43/255.0, green: 140/255.0, blue: 251/255.0, alpha: 1.0), for: .disabled)
        thirdEventBtn.setTitleColor(UIColor(red: 43/255.0, green: 140/255.0, blue: 251/255.0, alpha: 1.0), for: .disabled)
        fourthEventBtn.setTitleColor(UIColor(red: 43/255.0, green: 140/255.0, blue: 251/255.0, alpha: 1.0), for: .disabled)
        
        fullDownBtn.setBackgroundImage(#imageLiteral(resourceName: "down_full"), for: .disabled)
        halfUpBtnFirst.setBackgroundImage(#imageLiteral(resourceName: "up_half"), for: .disabled)
        halfDownBtnFirst.setBackgroundImage(#imageLiteral(resourceName: "down_half"), for: .disabled)
        halfUpBtnSecond.setBackgroundImage(#imageLiteral(resourceName: "up_half"), for: .disabled)
        halfDownBtnSecond.setBackgroundImage(#imageLiteral(resourceName: "down_half"), for: .disabled)
        fullUpBtn.setBackgroundImage(#imageLiteral(resourceName: "up_full"), for: .disabled)
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
            checkAnswer()
        } else if seconds < 5 {
            timerLabel.textColor = UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0)
            timerLabel.text = "Time left: \(String(format: "%.01f", seconds))"
        }
    }
}

