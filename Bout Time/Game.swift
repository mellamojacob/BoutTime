//
//  Game.swift
//  Bout Time
//
//  Created by Jacob Virgin on 7/21/16.
//  Copyright © 2016 Jacob Virgin. All rights reserved.
//

import UIKit
import GameKit

class Game: UIViewController {
    
    
    @IBOutlet weak var LabelOneButton: UIButton!
    @IBOutlet weak var LabelTwoButton: UIButton!
    @IBOutlet weak var LabelThreeButton: UIButton!
    @IBOutlet weak var LabelFourButton: UIButton!
    
    @IBOutlet weak var nextRoundButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    var roundCompleted = false
    
    
    //Whenever a label button is pressed, it opens the webView
    @IBAction func LabelButtonPressed(sender: AnyObject) {
        if roundCompleted{
        var index = 0
        for event in events {
            if event.title == "\((sender as! UIButton).currentTitle!)" {
                events[index].selected = true
            }
            index+=1
        }
        for event in events {
            if event.selected {
                print("\(event.title) \(event.selected)")
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let albumView: UIViewController = storyboard.instantiateViewControllerWithIdentifier("Album Information") as UIViewController
        self.presentViewController(albumView, animated: true, completion: nil)
        }
    }
    
    //The buttons to switch two events' order
    @IBAction func OneDownButton(sender: AnyObject) {
        switchEvents(change: 0, with: 1)
    }
    @IBAction func TwoUpButton(sender: AnyObject) {
        switchEvents(change: 1, with: 0)
    }
    @IBAction func TwoDownButton(sender: AnyObject) {
        switchEvents(change: 1, with: 2)
    }
    @IBAction func ThreeUpButton(sender: AnyObject) {
        switchEvents(change: 2, with: 1)
    }
    @IBAction func ThreeDownButton(sender: AnyObject) {
        switchEvents(change: 2, with: 3)
    }
    @IBAction func FourUpButton(sender: AnyObject) {
        switchEvents(change: 3, with: 2)
    }
    
    //next Round button pressed
    @IBAction func nextRound(sender: AnyObject) {
        loadNextRound()
    }
    
    //After 6 rounds, game is over. Play again option is pressed
    @IBAction func playAgain(sender: AnyObject) {
        numberOfRoundsPlayed = 0
        for view in self.view.subviews as [UIView] {
            view.hidden = !view.hidden
        }
        loadNextRound()
    }
    
    var selectedEvents:[Event] = []
    var exceptions:[Int] = []
    var indexOfEvent: Int = 0
    var buttonLabels: [UIButton] = []
    var timer = NSTimer()
    var counter = 60
    var points = 0
    var numberOfRoundsPlayed = 0

    //Beginning of game-initialize all events, hide all unimportant UIs
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCorrectDing()
        loadIncorrectBuzz()
        initializeEvents()
        displayEvents()
        nextRoundButton.hidden = true
        endLabel.hidden = true
        playAgainButton.hidden = true
        timerLabel.text = "\(counter)"
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //If the phone is shaken, it checks if the current order is correct
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            checkAnswer()
        }
    }
    
    //APP FUNCTIONING METHODS
    

    //Selects four random events to display
    func getSelectedEvents() {
        for _ in 0 ..< 4 {
            repeat {
                indexOfEvent = GKRandomSource.sharedRandom().nextIntWithUpperBound(events.count)
            } while exceptions.contains(indexOfEvent)
            selectedEvents.append(events[indexOfEvent])
            exceptions.append(indexOfEvent)
        }
        buttonLabels = [LabelOneButton, LabelTwoButton, LabelThreeButton, LabelFourButton]
    }
    
    func displayEvents() {
        getSelectedEvents()
        var i = 0
        for button in buttonLabels {
            button.setTitle(selectedEvents[i].title, forState: .Normal)
            i+=1
        }
        startTimer()
    }
    
    //Create Timer
    func startTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(Game.updateCounter), userInfo: nil, repeats: true)
    }
    
  
    
    //Checks to see if the four events are in the right order
    func checkAnswer(){
        timer.invalidate()
        if selectedEvents[0].year <= selectedEvents[1].year && selectedEvents[1].year <= selectedEvents[2].year && selectedEvents[2].year <= selectedEvents[3].year {
            points += 25
            nextRoundButton.setImage(UIImage(named: "next_round_success.png"), forState: UIControlState.Normal)
            timerLabel.text = "That is correct!"
            playCorrectDing()
        } else {
            nextRoundButton.setImage(UIImage(named: "next_round_fail.png"), forState: UIControlState.Normal)
            timerLabel.text = "That is incorrect"
            playIncorrectBuzz()
        }
        nextRoundButton.hidden = false
        numberOfRoundsPlayed+=1
        roundCompleted = true

    }
    
    //Load next round
    func loadNextRound(){
        if numberOfRoundsPlayed == 6{
            endLabel.text = "You scored \(points) points out of 150 points!"
            for view in self.view.subviews as [UIView] {
                view.hidden = !view.hidden
            }
            
        } else {
            selectedEvents = []
            unloadExceptionsArray()
            displayEvents()
            counter = 60
            timerLabel.text = "\(counter)"
            nextRoundButton.hidden = true
        }
        roundCompleted = false
    }
    
    
    //HELPER METHODS
    
    func switchEvents(change first: Int, with second: Int){
        buttonLabels[first].setTitle(selectedEvents[second].title, forState: .Normal)
        buttonLabels[second].setTitle(selectedEvents[first].title, forState: .Normal)
        let holder = selectedEvents[first]
        selectedEvents[first] = selectedEvents[second]
        selectedEvents[second] = holder
        
    }
    
    func updateCounter(){
        if timerLabel.text == "0"{
            timer.invalidate()
            checkAnswer()
        } else {
            counter -= 1
            timerLabel.text = "\(counter)"
        }
    }
    
    func unloadExceptionsArray(){
        for i in 0 ..< exceptions.count{
            exceptions[i] = 0
        }
    }
    

}
