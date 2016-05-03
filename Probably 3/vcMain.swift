//
//  ViewController.swift
//  Probably 3
//
//  Created by Spencer Smith on 4/26/16.
//  Copyright © 2016 Spencer Smith. All rights reserved.
//

import UIKit

class vcMain: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var dimensions: [NSLayoutConstraint]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapsLabel: UILabel!

    var data = NSUserDefaults.standardUserDefaults();
    var scoreboard = Scoreboard()
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .Alert)
    var name = "do not add"
    var taps = 0
    var score: Int = 0 {
        didSet{
            updateLabels()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        let boxWidth = screenWidth / 3
        
        for dim in dimensions{
            dim.constant = boxWidth
        }
        
        buttons[0].tag = 0
        buttons[1].tag = 1
        
        scoreLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 2
        
        alert.title = "New Highscore!"
        alert.message = "Please enter your name:"
        alert.addTextFieldWithConfigurationHandler { (textField) in
        }
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default) { (_) in
            self.name = self.alert.textFields![0].text!
            self.scoreboard.add(self.score, name: self.name)
            self.score = 0
        }
        
        alert.addAction(confirmAction)
        
        loadTaps()
        scoreboard.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click(sender: UIButton) {
        tap()
        if(sender.tag == Int(arc4random_uniform(2))){
            score += 1
            return
        }
        
        if(scoreboard.canBeAdded(score)){
            self.presentViewController(alert, animated: true, completion: nil)
            // setting of scoreboard moved to confirm action
        } else{
            self.score = 0
        }
    }
    
    func updateLabels(){
        scoreLabel.text = String(score)
        if(score < 3){
            scoreLabel.backgroundColor = colors[0]
            return
        }
        scoreLabel.backgroundColor = colors[score - 1]
    }
    
    func tap(){
        taps += 1
        tapsLabel.text = String(taps)
        
        userDefaults.setInteger(taps, forKey: Keys.taps)
    }
    
    func loadTaps(){
        taps = userDefaults.integerForKey(Keys.taps)
        tapsLabel.text = String(taps)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destView: vcSecond = segue.destinationViewController as! vcSecond
        destView.scoreboard = scoreboard
    }
}
