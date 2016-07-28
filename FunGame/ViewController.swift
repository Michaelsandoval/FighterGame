//
//  ViewController.swift
//  FunGame
//
//  Created by Michael Sandoval on 7/26/16.
//  Copyright © 2016 Michael Sandoval. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var whoWonLabel: UILabel!
    @IBOutlet weak var playerOneImage: UIImageView!
    @IBOutlet weak var playerTwoImage: UIImageView!
    @IBOutlet weak var playerOneHpLabel: UILabel!
    @IBOutlet weak var playerTwoHpLabel: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var playerOneButton: UIButton!
    @IBOutlet weak var playerTwoButton: UIButton!
    
    var playerOne: Player!
    var playerTwo: Player!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
         playerOne = Player(playerImage: UIImage(named: "player")!, score: 0, hp: 100, name: "Player One", attackPower: generateRandomNumber())
        
        playerTwo = Player(playerImage: UIImage(named: "enemy")!, score: 0, hp: 100, name: "Player Two", attackPower: generateRandomNumber())
        whoWonLabel.text = "Let the game begin!"
       
        restartButton.hidden = true
        
        
        
    }
    
    func generateRandomNumber() -> Int{
        let random = Int(arc4random_uniform(UInt32(20) + 10))
        return random
    }
    
    func playerWon(player: String) -> String {
        return "\(player) Whooped that ass!!!"
    }
    
    
    func generatePlayer() {
        if !playerOne.isAlive {
            playerOne = Player(playerImage: UIImage(named: "player")!, score: playerOne.score, hp: 100, name: "Player One", attackPower: generateRandomNumber())
            playerTwo = Player(playerImage: UIImage(named: "enemy")!, score: playerTwo.score, hp: 100, name: "Player Two", attackPower: generateRandomNumber())
            playerOneHpLabel.text = "100 HP"
            playerTwoHpLabel.text = "100 HP"
            playerOneImage.hidden = false
            
        }
        else if !playerTwo.isAlive {
            playerTwo = Player(playerImage: UIImage(named: "enemy")!, score: playerTwo.score, hp: 100, name: "Player Two", attackPower: generateRandomNumber())
            playerOne = Player(playerImage: UIImage(named: "player")!, score: playerOne.score, hp: 100, name: "Player One", attackPower: generateRandomNumber())
            
            playerOneHpLabel.text = "100 HP"
            playerTwoHpLabel.text = "100 HP"
            playerTwoImage.hidden = false
        }
    }

    func disablePlayerTwoAttack() {
        playerTwoButton.enabled = true
    }
    func disablePlayerOneAttack() {
        playerOneButton.enabled = true
    }



    @IBAction func onRestartButtoneTapped(sender: AnyObject) {
        generatePlayer()
        whoWonLabel.text = "Let the game begin!"
        restartButton.hidden = true
        
        
    }
    
    @IBAction func onPlayerOneAttackButtonTapped(sender: UIButton) {
        if playerTwo.attempAttack(playerOne.attackPower) {
            whoWonLabel.text = "Attack \(playerTwo.name) for \(playerOne.attackPower) HP"
            playerTwoHpLabel.text = "\(playerTwo.hp)"
            playerTwo = Player(hp: playerTwo.hp, attackPower: generateRandomNumber(), name: playerTwo.name)
            playerOneButton.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.disablePlayerOneAttack), userInfo: nil, repeats: false)
            
        }
        if !playerTwo.isAlive {
            playerTwoHpLabel.text = ""
            playerTwoImage.hidden = true
            whoWonLabel.text = playerWon(playerOne.name)
            restartButton.hidden = false
            
        }
        
    }
    
    @IBAction func onPlayerTwoAttackButtonTapped(sender: AnyObject) {
        if playerOne.attempAttack(playerTwo.attackPower) {
            whoWonLabel.text = "Attack \(playerOne.name) for \(playerTwo.attackPower) HP"
            playerOneHpLabel.text = "\(playerOne.hp)"
            playerOne = Player(hp: playerOne.hp, attackPower: generateRandomNumber(), name: playerOne.name)
            playerTwoButton.enabled = false
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.disablePlayerTwoAttack), userInfo: nil, repeats: false)
           
        }
    
        if !playerOne.isAlive {
            playerOneHpLabel.text = ""
            playerOneImage.hidden = true
            whoWonLabel.text = playerWon(playerTwo.name)
            restartButton.hidden = false
            
        }
    }
    
    
   
}

