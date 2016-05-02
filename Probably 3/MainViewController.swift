//
//  ViewController.swift
//  Probably 3
//
//  Created by Spencer Smith on 4/26/16.
//  Copyright © 2016 Spencer Smith. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var dimensions: [NSLayoutConstraint]!
    @IBOutlet weak var scoreLabel: UILabel!

    var data = NSUserDefaults.standardUserDefaults();
    var scoreboard = Scoreboard()
    var score: Int = 0 {
        didSet {
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
        
        scoreboard.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click(sender: UIButton) {
        if(sender.tag == Int(arc4random_uniform(2))){
            score += 1
        } else{
            scoreboard.add(score, name: "spence")
            score = 0
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
}
