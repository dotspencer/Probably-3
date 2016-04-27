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
    
    var colors = [
        UIColor.clearColor(),
        UIColor.clearColor(),
        UIColor(red:0.00, green:0.69, blue:0.93, alpha:1.00),
        UIColor(red:0.80, green:0.36, blue:0.36, alpha:1.00),
        UIColor(red:1.00, green:0.84, blue:0.00, alpha:1.00),
        UIColor(red:0.11, green:0.91, blue:0.26, alpha:1.00),
        UIColor(red:0.76, green:0.16, blue:0.91, alpha:1.00)
    ]
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        let scores = Scoreboard()
        scores.addNew(23, name: "Spence")
        scores.addNew(19, name: "Brooke")
        
        scores.show()
        scores.clear()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        
        let boxWidth = screenWidth / 3
        
        for dim in dimensions{
            dim.constant = boxWidth
        }
        
        buttons[0].tag = 0
        buttons[1].tag = 1
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
        if(score >= 3){
            scoreLabel.backgroundColor = colors[score - 1]
        } else{
            scoreLabel.backgroundColor = UIColor.clearColor()
        }
        scoreLabel.text = String(score)
    }
    
}

