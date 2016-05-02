//
//  Model.swift
//  Probably 3
//
//  Created by Spencer Smith on 5/2/16.
//  Copyright © 2016 Spencer Smith. All rights reserved.
//

import Foundation

class Scoreboard {
    var scores = [Record]()
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var data = [String : String]() // ["score", "name"]
    
    init(){
        pullData()
        loadData()
    }
    
    /// Adds score to data and loads data into scores list,
    /// does nothing if the score alrady exists or if score is less than 3
    func add(score: Int, name: String){
        if(!contains(score) && score > 2){
            pullData()
            
            data[String(score)] = name
            saveData()
            
            loadData()
            
            
            print("Score Added")
        }
    }
    
    /// Prints all scores out to the console
    func show(){
        for score in scores{
            print("\(score.score)\t\(score.name)")
        }
    }
    
    /// Checks if score already exists for that integer
    func contains(inputScore: Int) -> Bool{
        for score in scores{
            if(score.score == inputScore){
                return true
            }
        }
        return false
    }
    
    /// Checks if saved data exists
    func savedDataExists() -> Bool{
        return userDefaults.objectForKey(Keys.data) != nil
    }
    
    /// Saves data persistently
    func saveData(){
        userDefaults.setObject(data, forKey: Keys.data)
    }
    
    func pullData(){
        if(savedDataExists()){
            data = userDefaults.objectForKey(Keys.data) as! Dictionary
        }
    }

    func loadData(){
        scores.removeAll()
        for (score, name) in data{
            scores.append(Record(score: Int(score)!, name: name))
        }
        scores = scores.sort(Record.order)
    }
    
}

class Record{
    var score = 0
    var name = ""
    
    init(score: Int, name: String){
        self.score = score
        self.name = name
    }
    
    static func order(a: Record, b: Record) -> Bool{
        return a.score > b.score
    }
}