//
//  ViewController.swift
//  Probably 3
//
//  Created by Spencer Smith on 4/26/16.
//  Copyright © 2016 Spencer Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var dimensions: [NSLayoutConstraint]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    
    let colors = [
        UIColor.clearColor(),
        UIColor.clearColor(),
        UIColor(red:0.11, green:0.69, blue:0.93, alpha:1.00), // 3
        UIColor(red:0.80, green:0.36, blue:0.36, alpha:1.00), // 4
        UIColor(red:1.00, green:0.84, blue:0.19, alpha:1.00), // 5
        UIColor(red:0.38, green:0.87, blue:0.44, alpha:1.00), // 6
        UIColor(red:0.86, green:0.42, blue:0.97, alpha:1.00), // 7
        UIColor(red:0.99, green:0.63, blue:0.16, alpha:1.00), // 8
        UIColor(red:0.63, green:0.76, blue:0.88, alpha:1.00), // 9
        UIColor(red:0.94, green:0.99, blue:0.21, alpha:1.00), // 10
        UIColor(red:0.99, green:0.25, blue:0.73, alpha:1.00), // 11
        UIColor(red:0.92, green:0.84, blue:0.63, alpha:1.00), // 12
        UIColor(red:0.39, green:0.65, blue:0.62, alpha:1.00), // 13
        UIColor(red:0.95, green:0.51, blue:0.42, alpha:1.00), // 14
        UIColor(red:0.05, green:0.43, blue:0.55, alpha:1.00), // 15
        UIColor(red:0.89, green:0.46, blue:0.12, alpha:1.00), // 16
        UIColor(red:0.71, green:0.82, blue:0.32, alpha:1.00), // 17
        UIColor(red:0.65, green:0.24, blue:0.36, alpha:1.00), // 18
        UIColor(red:0.65, green:0.77, blue:0.73, alpha:1.00), // 19
        UIColor(red:0.42, green:0.49, blue:0.98, alpha:1.00) // 20
    ]
    
    var data = NSUserDefaults.standardUserDefaults();
    var score: Int = 0
    var scoresKey = "scoresKey"
    let test = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        testLabel.text = String(data.integerForKey(test))

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
    }
    
    @IBAction func click(sender: UIButton) {
        if(sender.tag == Int(arc4random_uniform(2))){
            score += 1
            updateScore()
        } else{
            score = 0
            updateScore()
        }
        print()
    }
    
    func updateScore(){
        if(score > data.integerForKey(test)){
            data.setInteger(score, forKey: test)
        }
        
        testLabel.text = String(data.integerForKey(test))
        testLabel.backgroundColor = colors[data.integerForKey(test) - 1]
        
        if(score >= 3){
            scoreLabel.backgroundColor = colors[score - 1]
        } else{
            scoreLabel.backgroundColor = UIColor.clearColor()
        }
        scoreLabel.text = String(score)
    }
    
}

