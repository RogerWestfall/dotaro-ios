//
//  DrumPadScene.swift
//  Dotaro
//
//  Created by Roger Westfall on 1/16/17.
//  Copyright © 2017 Roger Westfall. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

var userAudioDefault = defaults.integer(forKey: "userAudioDefault")

class DrumPadScene: SKScene {

     let mainMenuButton = SKSpriteNode(imageNamed: "dot3")
    
    override func didMove(to view: SKView) {
    
    backgroundColor = SKColor.white
        
        let headerLabel = SKLabelNode(fontNamed: "Pusab")
        headerLabel.text = "Settings and Bonus Drum Pad"
        headerLabel.fontSize = 15
        headerLabel.fontColor = SKColor.lightGray
        headerLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        headerLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.95)
        headerLabel.zPosition = 1
        self.addChild(headerLabel)
        
     /*   let drumpadLabel = SKLabelNode(fontNamed: "Pusab")
        drumpadLabel.text = "Drum Pad"
        drumpadLabel.fontSize = 25
        drumpadLabel.fontColor = SKColor.lightGray
        drumpadLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        drumpadLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.55)
        drumpadLabel.zPosition = 1
        self.addChild(drumpadLabel) */
        
        mainMenuButton.setScale(0.08)
        mainMenuButton.zPosition = 2
        mainMenuButton.position = CGPoint(x: self.size.width*0.9, y: self.size.height*0.05)
        mainMenuButton.name = "MainMenuButton"
        self.addChild(mainMenuButton)
        
        
        let historicalLabel = SKLabelNode(fontNamed: "Pusab")
        historicalLabel.text = "Total Score \(historicalScoreNumber)"
        historicalLabel.fontSize = 15
        historicalLabel.fontColor = SKColor.lightGray
        historicalLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        historicalLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.90)
        historicalLabel.zPosition = 1
        self.addChild(historicalLabel)
        
        
        let drumKit1Label = SKLabelNode (fontNamed: "Pusab")
        drumKit1Label.text = "Roland TR-808"
        drumKit1Label.fontSize = 15
        drumKit1Label.fontColor = SKColor.lightGray
        drumKit1Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        drumKit1Label.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.81)
        drumKit1Label.zPosition = 1
        self.addChild(drumKit1Label)
        
        let drumKit2Label = SKLabelNode (fontNamed: "Pusab")
        drumKit2Label.text = "Yamaha DD-8"
        drumKit2Label.fontSize = 15
        drumKit2Label.fontColor = SKColor.lightGray
        drumKit2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        drumKit2Label.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.74)
        drumKit2Label.zPosition = 1
        self.addChild(drumKit2Label)
        
        let drumKit3Label = SKLabelNode (fontNamed: "Pusab")
        drumKit3Label.text = "Game Boy 8-Bit Drums"
        drumKit3Label.fontSize = 15
        drumKit3Label.fontColor = SKColor.lightGray
        drumKit3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        drumKit3Label.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.67)
        drumKit3Label.zPosition = 1
        self.addChild(drumKit3Label)
        
        let drumKit4Label = SKLabelNode (fontNamed: "Pusab")
        drumKit4Label.text = "Game Boy 8-Bit Tones"
        drumKit4Label.fontSize = 15
        drumKit4Label.fontColor = SKColor.lightGray
        drumKit4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        drumKit4Label.position = CGPoint(x: self.size.width*0.3, y: self.size.height*0.6)
        drumKit4Label.zPosition = 1
        self.addChild(drumKit4Label)
        
        
        
        let dot808 = SKSpriteNode(imageNamed: "dot6")
        dot808.setScale(0.1)
        dot808.zPosition = 2
        dot808.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.82)
        dot808.name = "Dot808"
        self.addChild(dot808)
        
        let dotDD8 = SKSpriteNode(imageNamed: "dot6")
        dotDD8.setScale(0.1)
        dotDD8.zPosition = 2
        dotDD8.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.75)
        dotDD8.name = "DotDD8"
        self.addChild(dotDD8)
        
        let dotGB = SKSpriteNode(imageNamed: "dot6")
        dotGB.setScale(0.1)
        dotGB.zPosition = 2
        dotGB.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.68)
        dotGB.name = "DotGB"
        self.addChild(dotGB)
        
        let dotGBT = SKSpriteNode(imageNamed: "dot6")
        dotGBT.setScale(0.1)
        dotGBT.zPosition = 2
        dotGBT.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.61)
        dotGBT.name = "DotGBT"
        self.addChild(dotGBT)

        
        
        
        
        
        let dot1 = SKSpriteNode(imageNamed: "dot1")
        dot1.setScale(0.25)
        dot1.zPosition = 2
        dot1.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.45)
        dot1.name = "Dot1"
        self.addChild(dot1)
     
        let dot2 = SKSpriteNode(imageNamed: "dot2")
        dot2.setScale(0.25)
        dot2.zPosition = 2
        dot2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.45)
        dot2.name = "Dot2"
        self.addChild(dot2)
        
        let dot3 = SKSpriteNode(imageNamed: "dot3")
        dot3.setScale(0.25)
        dot3.zPosition = 2
        dot3.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.45)
        dot3.name = "Dot3"
        self.addChild(dot3)
        
        
        
        let dot4 = SKSpriteNode(imageNamed: "dot4")
        dot4.setScale(0.25)
        dot4.zPosition = 2
        dot4.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.3)
        dot4.name = "Dot4"
        self.addChild(dot4)
        
        let dot5 = SKSpriteNode(imageNamed: "dot5")
        dot5.setScale(0.25)
        dot5.zPosition = 2
        dot5.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.3)
        dot5.name = "Dot5"
        self.addChild(dot5)
        
        let dot6 = SKSpriteNode(imageNamed: "dot6")
        dot6.setScale(0.25)
        dot6.zPosition = 2
        dot6.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.3)
        dot6.name = "Dot6"
        self.addChild(dot6)
        
        
        
        let dot7 = SKSpriteNode(imageNamed: "dot7")
        dot7.setScale(0.25)
        dot7.zPosition = 2
        dot7.position = CGPoint(x: self.size.width*0.2, y: self.size.height*0.15)
        dot7.name = "Dot7"
        self.addChild(dot7)
        
        let dot8 = SKSpriteNode(imageNamed: "dot8")
        dot8.setScale(0.25)
        dot8.zPosition = 2
        dot8.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.15)
        dot8.name = "Dot8"
        self.addChild(dot8)
        
        let dot9 = SKSpriteNode(imageNamed: "dot9")
        dot9.setScale(0.25)
        dot9.zPosition = 2
        dot9.position = CGPoint(x: self.size.width*0.8, y: self.size.height*0.15)
        dot9.name = "Dot9"
        self.addChild(dot9)
        
        run(soundKick808_3)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if userAudioDefault == 0 {
            
            if nameOfTappedNode == "Dot1"{
                    run(soundKick808_1) }
            
            if nameOfTappedNode == "Dot2"{
                run(soundSnare808_1) }
            
            if nameOfTappedNode == "Dot3"{
                run(soundHiHat808_1) }
            
            if nameOfTappedNode == "Dot4"{
                run(soundKick808_3) }
            
            if nameOfTappedNode == "Dot5"{
                run(soundSnare808_2) }
            
            if nameOfTappedNode == "Dot6"{
                run(soundHiHat808_2) }
            
            if nameOfTappedNode == "Dot7"{
                run(soundStab1) }
            
            if nameOfTappedNode == "Dot8"{
                run(soundSnare808_4) }
            
            if nameOfTappedNode == "Dot9"{
                run(soundCowbell808_1)}
                
                
                } else if userAudioDefault == 1 {
                
                if nameOfTappedNode == "Dot1"{
                    run(soundKickDD8_1) }
                
                if nameOfTappedNode == "Dot2"{
                    run(soundSnareDD8_1) }
                
                if nameOfTappedNode == "Dot3"{
                    run(soundHiHatDD8_1) }
                
                if nameOfTappedNode == "Dot4"{
                    run(soundKickDD8_3) }
                
                if nameOfTappedNode == "Dot5"{
                    run(soundSnareDD8_2) }
                
                if nameOfTappedNode == "Dot6"{
                    run(soundHiHatDD8_2) }
                
                if nameOfTappedNode == "Dot7"{
                    run(soundStabDD8_1) }
                
                if nameOfTappedNode == "Dot8"{
                    run(soundStabDD8_3) }
                
                if nameOfTappedNode == "Dot9"{
                    run(soundStabDD8_2)}
                
                
            } else if userAudioDefault == 2 {
                
                if nameOfTappedNode == "Dot1"{
                    run(soundKickGB_1) }
                
                if nameOfTappedNode == "Dot2"{
                    run(soundSnareGB_1) }
                
                if nameOfTappedNode == "Dot3"{
                    run(soundKickGBT_9) }
                
                if nameOfTappedNode == "Dot4"{
                    run(soundKickGB_3) }
                
                if nameOfTappedNode == "Dot5"{
                    run(soundSnareGB_2) }
                
                if nameOfTappedNode == "Dot6"{
                    run(soundKickGBT_1) }
                
                if nameOfTappedNode == "Dot7"{
                    run(soundStabGB_1) }
                
                if nameOfTappedNode == "Dot8"{
                    run(soundStabGB_3) }
                
                if nameOfTappedNode == "Dot9"{
                    run(soundStabGB_2)}
                
                
            
            } else if userAudioDefault == 3 {
                
                    if nameOfTappedNode == "Dot1"{
                        run(soundKickGBT_1) }
                    
                    if nameOfTappedNode == "Dot2"{
                        run(soundKickGBT_2) }
                    
                    if nameOfTappedNode == "Dot3"{
                        run(soundKickGBT_3) }
                    
                    if nameOfTappedNode == "Dot4"{
                        run(soundKickGBT_4) }
                    
                    if nameOfTappedNode == "Dot5"{
                        run(soundKickGBT_5) }
                    
                    if nameOfTappedNode == "Dot6"{
                        run(soundKickGBT_6) }
                    
                    if nameOfTappedNode == "Dot7"{
                        run(soundKickGBT_7) }
                    
                    if nameOfTappedNode == "Dot8"{
                        run(soundKickGBT_8) }
                    
                    if nameOfTappedNode == "Dot9"{
                        run(soundKickGBT_9) }
                } 
            
            if nameOfTappedNode == "MainMenuButton"{
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.01)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
            if nameOfTappedNode == "Dot808"{
                userAudioDefault = (0)
                defaults.set(userAudioDefault, forKey: "userAudioDefault")}
                
            if nameOfTappedNode == "DotDD8"{
                userAudioDefault = (1)
                defaults.set(userAudioDefault, forKey: "userAudioDefault")}
                
            if nameOfTappedNode == "DotGB"{
                userAudioDefault = (2)
                defaults.set(userAudioDefault, forKey: "userAudioDefault")}
            
            if nameOfTappedNode == "DotGBT"{
                userAudioDefault = (3)
                defaults.set(userAudioDefault, forKey: "userAudioDefault")}

            
            
                
            }

            
            
            
            
            
            
            
        }
    
}


