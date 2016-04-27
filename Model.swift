//
//  Model.swift
//  Probably 3
//
//  Created by Spencer Smith on 4/26/16.
//  Copyright © 2016 Spencer Smith. All rights reserved.
//

import Foundation

class Record{
    var score: Int
    var name: String
    
    init(score: Int, name: String){
        self.name = name
        self.score = score
    }
    
    var description: String {
        return "\(score) - \(name)"
    }
}

class Scoreboard{
    var list: [Record] = []
    
    func addNew(score: Int, name: String){
        list.append(Record(score: score, name: name))
        list = list.sort(order)
    }
    
    func show(){
        for record in list{
            print(record.description)
        }
    }
    
    func order(a: Record, b: Record) -> Bool{
        return a.score > b.score
    }
    
    func clear(){
        list.removeAll()
    }
}