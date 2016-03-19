//
//  Player.swift
//  oop_exercise
//
//  Created by Hector Rios on 17/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import Foundation

class Player: Character {
    
    private var _name : String = "Player"
    private var _blocked = false
    
    var name : String {
        get {
            return self._name
        }
    }
    
    var blocked: Bool {
        get {
            return self._blocked
        }
        
        set {
            self._blocked = newValue
        }
    }
    
    //MARK: Initializer
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHp: hp, attackPwr: attackPower)
        self._name = name
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if self.isAlive {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}
