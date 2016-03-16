//
//  ViewController.swift
//  oop_exercise
//
//  Created by Hector Rios on 08/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var player1ImageView: UIImageView!
    @IBOutlet weak var player2ImageView: UIImageView!
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var player2AttackBtn: UIButton!
    
    //MARK: private vars
    var player1 : Character?;
    var player2 : Character?;
    
    //MARK: lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initGame()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    //MARK: functions
    
    func initGame() {
        self.lblMessage.text = ""
        
        self.player1 = Character(name: "Ork", startingHp: 100, attackPwr: 60)
        self.player2 = Character(name: "Soldier", startingHp: 100, attackPwr: 70)

        if let p1 = player1, let p2 = player2 {
            print("The player1  name is \(p1.name) and player2 name is \(p2.name)")
        } else {
            print("One or two of the players have not been initialized.")
        }
        
    }


}

