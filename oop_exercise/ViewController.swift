//
//  ViewController.swift
//  oop_exercise
//
//  Created by Hector Rios on 08/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var player1ImageView: UIImageView!
    @IBOutlet weak var player2ImageView: UIImageView!
    @IBOutlet weak var player1AttackBtn: UIButton!
    @IBOutlet weak var player2AttackBtn: UIButton!
    @IBOutlet weak var lblRestartGame: UILabel!
    @IBOutlet weak var btnRestartGame: UIButton!
    @IBOutlet weak var lblPlayer1Attack: UILabel!
    @IBOutlet weak var lblPlayer2Attack: UILabel!
    
    //MARK: private vars
    var player1 : Player?;
    var player2 : Player?;
    var isGameOver: Bool = false
    var backgroundMusic: AVAudioPlayer!
    
    //MARK: lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("Sky Portal", ofType: "mp3")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try backgroundMusic = AVAudioPlayer(contentsOfURL: soundUrl)
            backgroundMusic.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }

        
        self.initGame()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    
    @IBAction func onPlayer1BtnClicked(sender: UIButton) {
        
        if (self.isGameOver) {
            return;
        }
        
        if let p1 = player1, p2 = player2 {
            
            if !p2.blocked {
                self.player2AttackBtn.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "reenableButtons", userInfo: nil, repeats: false)
            }
            
            if p2.attemptAttack(p1.attackPwr) {
                self.lblMessage.text = "Player 2 attacked. Health at \(p2.hp)"
            }
            
            if !p2.isAlive {
                self.setGameOver("Player 1 wins. Game Over!")
            }
            
        }
    }
    
    @IBAction func onPlayer2BtnChecked(sender: UIButton) {
        
        if (self.isGameOver) {
            return;
        }
        
        if let p1 = player1, p2 = player2 {
            
            if !p1.blocked {
                self.player1AttackBtn.enabled = false
                NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "reenableButtons", userInfo: nil, repeats: false)
            }
            
            if p1.attemptAttack(p2.attackPwr) {
                self.lblMessage.text = "Player 1 attacked. Health at \(p1.hp)"
            }
            
            if !p1.isAlive {
                self.setGameOver("Player 2 wins. Game Over!")
            }
            
        }
    }
    
    @IBAction func onRestartGameBtnClicked(sender: UIButton) {
        //Hide the restart button and it's label
        self.btnRestartGame.hidden = true
        self.lblRestartGame.hidden = true
        
        //Show the attack buttons and their corresponding labels.
        self.player1AttackBtn.hidden = false
        self.lblPlayer1Attack.hidden = false
        self.player2AttackBtn.hidden = false
        self.lblPlayer2Attack.hidden = false
        
        self.attackButtonsActive(true)
        
        self.initGame()
    }
    
    //MARK: functions
    func initGame() {
        self.lblMessage.text = ""
        
        self.player1 = Player(name: "Ork", hp: 100, attackPower: 20)
        self.player2 = Player(name: "Soldier", hp: 100, attackPower: 25)

        if let p1 = player1, let p2 = player2 {
            print("The player1  name is \(p1.name) and player2 name i   s \(p2.name)")
        } else {
            print("One or two of the players have not been initialized.")
        }
        
        self.lblMessage.text = "Get Ready to Fight"
        
        self.isGameOver = false
        
        //start background music
        self.backgroundMusic.play()
    }
    
    func setGameOver(message: String) {
        self.isGameOver = true
        //self.attackButtonsActive(false)
        
        self.lblMessage.text = message
        
        //Hide the attackButtons
        self.hideAttackButtons()
        //Show the click to restart buttons
        self.btnRestartGame.hidden = false
        self.lblRestartGame.hidden = false
        
        self.backgroundMusic.stop()
        
    }
    
    func attackButtonsActive(activate: Bool) {
        if activate {
            self.player2AttackBtn.enabled = true
            self.player1AttackBtn.enabled = true
        } else {
            self.player2AttackBtn.enabled = false
            self.player1AttackBtn.enabled = false
        }
    }
    
    func reenableButtons() {
        if !self.isGameOver {
            self.attackButtonsActive(true)
            if let p1 = player1, p2 = player2 {
                p1.blocked = false
                p2.blocked = false
            }
        }
        
    }
    
    func hideAttackButtons() {
        self.player1AttackBtn.hidden = true
        self.player2AttackBtn.hidden = true
        self.lblPlayer1Attack.hidden = true
        self.lblPlayer2Attack.hidden = true
    }


}

