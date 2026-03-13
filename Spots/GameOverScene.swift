//
//  GameOverScene.swift
//  Dotaro
//
//  Created by Roger Westfall on 12/23/16.
//  Copyright © 2016 Roger Westfall. All rights reserved.
//

import Foundation
import SpriteKit

 let defaults = UserDefaults()

var historicalScoreNumber = defaults.integer(forKey: "historicalNumberSaved")


class GameOverScene: SKScene {
    
    let restartLabel = SKLabelNode(fontNamed: "Pusab")
    let restartLabel2 = SKLabelNode(fontNamed: "Pusab")
    let restartButton = SKSpriteNode(imageNamed: "dot2")
    let settingsButton = SKSpriteNode(imageNamed: "dot6")
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.white
        
        settingsButton.setScale(0.08)
        settingsButton.zPosition = 2
        settingsButton.position = CGPoint(x: self.size.width*0.9, y: self.size.height*0.05)
        settingsButton.name = "SettingsButton"
        self.addChild(settingsButton)
        
        let scoreLabel = SKLabelNode(fontNamed: "Pusab")
        scoreLabel.text = "Score \(gameScore)"
        scoreLabel.fontSize = 15
        scoreLabel.fontColor = SKColor.lightGray
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.95)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
       
        
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if (gameScore) > highScoreNumber{
            highScoreNumber = (gameScore)
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }
        
       
        
        let highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScoreLabel.text = "High \(highScoreNumber)"
        highScoreLabel.fontSize = 15
        highScoreLabel.fontColor = SKColor.lightGray
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        highScoreLabel.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.95)
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        
        
        historicalScoreNumber += gameScore
        defaults.set(historicalScoreNumber, forKey: "historicalNumberSaved")

        
        let historicalLabel = SKLabelNode(fontNamed: "Pusab")
        historicalLabel.text = "Total \(historicalScoreNumber)"
        historicalLabel.fontSize = 15
        historicalLabel.fontColor = SKColor.lightGray
        historicalLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        historicalLabel.position = CGPoint(x: self.size.width*0.95, y: self.size.height*0.95)
        historicalLabel.zPosition = 1
        self.addChild(historicalLabel)
        
        
      //  attempt to add commas to total score number
         
        let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.string(from: NSNumber(value: historicalScoreNumber))
    
        
        let gameOverLabel = SKLabelNode(fontNamed: "Pusab")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontColor = SKColor.lightGray
        gameOverLabel.fontSize = 30
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.33)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        restartLabel.text = "Play"
        restartLabel.fontSize = 20
        restartLabel.fontColor = SKColor.white
        restartLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        restartLabel.zPosition = 3
        self.addChild(restartLabel)
        
        restartLabel2.text = "Again"
        restartLabel2.fontSize = 20
        restartLabel2.fontColor = SKColor.white
        restartLabel2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.47)
        restartLabel2.zPosition = 3
        self.addChild(restartLabel2)
        
        
        restartButton.setScale(0.25)
        restartButton.zPosition = 2
        restartButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
        self.addChild(restartButton)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let pointOfTouch = touch.location(in: self)
            
            if restartButton.contains(pointOfTouch){
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.01)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
            
            if settingsButton.contains(pointOfTouch){
                let sceneToMoveTo2 = DrumPadScene(size: self.size)
                run(soundSnare808_2)
                sceneToMoveTo2.scaleMode = self.scaleMode
                let myTransition2 = SKTransition.fade(withDuration: 0.01)
                self.view!.presentScene(sceneToMoveTo2, transition: myTransition2)
                
            }
            
            
        }
    }
    
    
    
}
