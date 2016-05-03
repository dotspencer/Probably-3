//
//  vcSecond.swift
//  Probably 3
//
//  Created by Spencer Smith on 5/2/16.
//  Copyright © 2016 Spencer Smith. All rights reserved.
//

import UIKit

class vcSecond: UIViewController {
    
    @IBOutlet weak var highscoresLabel: UILabel!
    @IBOutlet weak var hsWidth: NSLayoutConstraint!
    
    @IBOutlet weak var numberOneScore: UILabel!
    @IBOutlet weak var numberOneName: UILabel!
    
    var scoreboard = Scoreboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        highscoresLabel.text = scoreboard.toStringButFirst()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        hsWidth.constant = screenWidth * 0.8
        
        // Probably would be better to get the actual list and do the handling here...
        
        let numberOne = scoreboard.getHighest()
        numberOneScore.text = String(numberOne!.score)
        numberOneScore.backgroundColor = colors[numberOne!.score - 1]
        numberOneName.text = numberOne!.name
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}
