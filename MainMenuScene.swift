//
//  MainMenuScene.swift
//  Dotaro
//
//  Created by Roger Westfall on 1/12/17.
//  Copyright © 2017 Roger Westfall. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{

    let startButton = SKSpriteNode(imageNamed: "dot3")
    let settingsButton = SKSpriteNode(imageNamed: "dot6")
    
        override func didMove(to view: SKView) {
            
            backgroundColor = SKColor.white
            
            
            let gameName1 = SKLabelNode(fontNamed: "The Bold Font")
            gameName1.text = "Better with Headphones"
            gameName1.fontSize = 20
            gameName1.fontColor = SKColor.lightGray
            gameName1.alpha = 0
            gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.3)
            gameName1.zPosition = 1
            self.addChild(gameName1)
            
            let gameName2 = SKLabelNode(fontNamed: "The Bold Font")
            gameName2.text = "Feel the Bass"
            gameName2.fontSize = 30
            gameName2.fontColor = SKColor.lightGray
            gameName2.alpha = 0
            gameName2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.25)
            gameName2.zPosition = 1
            self.addChild(gameName2)
            
            let startLabel = SKLabelNode(fontNamed: "Pusab")
            startLabel.text = "Play"
            startLabel.fontSize = 20
            startLabel.fontColor = SKColor.white
            startLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.485)
            startLabel.zPosition = 3
            self.addChild(startLabel)
            
           /* let headphones = SKSpriteNode(imageNamed: "headphones")
            headphones.setScale(0.25)
            headphones.zPosition = 4
            headphones.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
            self.addChild(headphones)*/
            
            
            startButton.setScale(0.25)
            startButton.zPosition = 2
            startButton.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.5)
            startButton.name = "StartButton"
            self.addChild(startButton)
            
            settingsButton.setScale(0.08)
            settingsButton.zPosition = 2
            settingsButton.position = CGPoint(x: self.size.width*0.9, y: self.size.height*0.05)
            settingsButton.name = "SettingsButton"
            self.addChild(settingsButton)

            // Version label — reads CFBundleShortVersionString and CFBundleVersion
            // from the bundle at runtime so it always matches the project settings.
            let info = Bundle.main.infoDictionary
            let shortVersion = info?["CFBundleShortVersionString"] as? String ?? "0"
            let buildNumber  = info?["CFBundleVersion"]            as? String ?? "0"
            let versionLabel = SKLabelNode(fontNamed: "Pusab")
            versionLabel.text = "v\(shortVersion) (\(buildNumber))"
            versionLabel.fontSize = 10
            versionLabel.fontColor = SKColor.lightGray
            versionLabel.horizontalAlignmentMode = .left
            versionLabel.position = CGPoint(x: self.size.width*0.05, y: self.size.height*0.02)
            versionLabel.zPosition = 1
            self.addChild(versionLabel)
   

            let fadeInAction = SKAction.fadeIn(withDuration: 5.0)
            //headphones.run(fadeInAction)
            gameName1.run(fadeInAction)
            gameName2.run(fadeInAction)
            
            run(soundKick808_3)
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                
            let pointOfTouch = touch.location(in: self)
            
            
                if startButton.contains(pointOfTouch){
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

