//
//  Player.swift
//  FunGame
//
//  Created by Michael Sandoval on 7/26/16.
//  Copyright © 2016 Michael Sandoval. All rights reserved.
//

import Foundation
import UIKit

class Player: Character {
    
    private var _score: Int = 0
    private var _type: String = ""
    private var _playerImage: UIImage!
    

    
    var score: Int {
        get {
            return _score
        }
    }
    
    var type: String {
        get {
            return _type
        }
    }
    var playerImage: UIImage {
        get {
            return _playerImage
        }
    }
    
    func addScore (score: Int) {
        if !isAlive {
            self._score += score
        }
        
    }
    
    
    
    convenience init(playerImage: UIImage, score: Int, hp: Int, name: String, attackPower: Int) {
        self.init(hp: hp, attackPower: attackPower, name: name)
       _score = score
    }
    
}