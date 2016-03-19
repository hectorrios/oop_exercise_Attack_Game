//
//  Character.swift
//  oop_exercise
//
//  Created by Hector Rios on 09/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp : Int
    private var _attackPwr : Int

    //MARK: Setter and Getters
    var hp : Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return self._attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            return (self._hp > 0)
        }
    }
    
    //MARK: Initializers
    init(startingHp: Int, attackPwr: Int) {
        
        //default hp and attackPwr
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    //MARK: methods
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
    
}
