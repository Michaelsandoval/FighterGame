//
//  Character.swift
//  FunGame
//
//  Created by Michael Sandoval on 7/26/16.
//  Copyright © 2016 Michael Sandoval. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    private var _name: String = "Player"
    
    var hp: Int {
        get {
        return _hp
        }
    }

    var attackPower: Int {
        get {
        return _attackPower
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(hp: Int, attackPower: Int, name : String) {
        self._hp = hp
        self._attackPower = attackPower
        self._name = name
        
    }
    
    func attempAttack (attackPower: Int) -> Bool {
            self._hp -= attackPower
        return true
        
    }
    
    
    
}
