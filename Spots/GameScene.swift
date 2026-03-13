//
//  GameScene.swift
//  Dotaro
//
//  Created by Roger Westfall on 12/23/16.
//  Copyright © 2016 Roger Westfall. All rights reserved.
//

import SpriteKit
import GameplayKit

// var userAudioDefault = 1

// 0 (default) = Roland TR-808
// 1 = Yamaha DD-8
// 2 = Gameboy 8-bit drums
// 3 = Gamneboy 8-bit tones


var scoreNumber = 0
var scoreNumber2 = 0
var gameScore = 0


//  808 Audio
let soundKick808_1 = SKAction.playSoundFileNamed("kick4.wav", waitForCompletion: false) //hard kick
let soundKick808_2 = SKAction.playSoundFileNamed("kick2.wav", waitForCompletion: false)
let soundKick808_3 = SKAction.playSoundFileNamed("kick3.wav", waitForCompletion: false) //bass
let soundKick808_4 = SKAction.playSoundFileNamed("808-Kicks09.wav", waitForCompletion: false)

let soundSnare808_1 = SKAction.playSoundFileNamed("snare1.wav", waitForCompletion: false) //hard snare
let soundSnare808_2 = SKAction.playSoundFileNamed("snare2.wav", waitForCompletion: false) //clap
let soundSnare808_3 = SKAction.playSoundFileNamed("snare3.wav", waitForCompletion: false) // tight snare
let soundSnare808_4 = SKAction.playSoundFileNamed("snare4.wav", waitForCompletion: false) // rimshot

let soundHiHat808_1 = SKAction.playSoundFileNamed("hiHat1.WAV", waitForCompletion: false)
let soundHiHat808_2 = SKAction.playSoundFileNamed("hiHat2.WAV", waitForCompletion: false)
let soundCowbell808_1 = SKAction.playSoundFileNamed("808-Cowbell1.wav", waitForCompletion: false)
let soundMaracas808_1 = SKAction.playSoundFileNamed("808-Maracas1.wav", waitForCompletion: false)
let soundTom808_1 = SKAction.playSoundFileNamed("tom.wav", waitForCompletion: false)
let soundGameOver808_1 = SKAction.playSoundFileNamed("bass21.wav", waitForCompletion: false)
let soundStab1 = SKAction.playSoundFileNamed("Famoush.wav", waitForCompletion: false)


// Yamaha DD-8
let soundKickDD8_1 = SKAction.playSoundFileNamed("DD8kick1.wav", waitForCompletion: false) //hard kick
let soundKickDD8_2 = SKAction.playSoundFileNamed("DD8kick3.wav", waitForCompletion: false)
let soundKickDD8_3 = SKAction.playSoundFileNamed("DD8kick2.wav", waitForCompletion: false) //bass
let soundKickDD8_4 = SKAction.playSoundFileNamed("DD8kick1.wav", waitForCompletion: false)

let soundSnareDD8_1 = SKAction.playSoundFileNamed("DD8snare1.wav", waitForCompletion: false)
let soundSnareDD8_2 = SKAction.playSoundFileNamed("DD8snare2.wav", waitForCompletion: false) //clap
let soundSnareDD8_3 = SKAction.playSoundFileNamed("DD8snare3.wav", waitForCompletion: false) // tight snare
let soundSnareDD8_4 = SKAction.playSoundFileNamed("DD8snap.wav", waitForCompletion: false) // rimshot

let soundHiHatDD8_1 = SKAction.playSoundFileNamed("DD8hihat.wav", waitForCompletion: false)
let soundHiHatDD8_2 = SKAction.playSoundFileNamed("DD8crash.wav", waitForCompletion: false)

let soundStabDD8_1 = SKAction.playSoundFileNamed("DD8stab.wav", waitForCompletion: false) //stab
let soundStabDD8_2 = SKAction.playSoundFileNamed("DD8cat.wav", waitForCompletion: false) //stab
let soundStabDD8_3 = SKAction.playSoundFileNamed("DD8dawg.wav", waitForCompletion: false) //stab



// Game Boy 8-bit
let soundKickGB_1 = SKAction.playSoundFileNamed("GBkick3.wav", waitForCompletion: false) //hard kick
let soundKickGB_2 = SKAction.playSoundFileNamed("GBkick3.wav", waitForCompletion: false)
let soundKickGB_3 = SKAction.playSoundFileNamed("GBkick3.wav", waitForCompletion: false) //bass
let soundKickGB_4 = SKAction.playSoundFileNamed("GBkick4.wav", waitForCompletion: false)

let soundSnareGB_1 = SKAction.playSoundFileNamed("GBsnare1.wav", waitForCompletion: false)
let soundSnareGB_2 = SKAction.playSoundFileNamed("GBsnare4.wav", waitForCompletion: false) //clap
let soundSnareGB_3 = SKAction.playSoundFileNamed("GBsnare3.wav", waitForCompletion: false) // tight snare
let soundSnareGB_4 = SKAction.playSoundFileNamed("GBsnare2.wav", waitForCompletion: false) // rimshot

let soundStabGB_1 = SKAction.playSoundFileNamed("GBarp3.wav", waitForCompletion: false) //stab
let soundStabGB_2 = SKAction.playSoundFileNamed("GBarp2.wav", waitForCompletion: false) //stab
let soundStabGB_3 = SKAction.playSoundFileNamed("GBarp1.wav", waitForCompletion: false) //stab





// Game Boy 8-bit tones
let soundKickGBT_1 = SKAction.playSoundFileNamed("GBpulse1.wav", waitForCompletion: false) //hard kick
let soundKickGBT_2 = SKAction.playSoundFileNamed("GBpulse2.wav", waitForCompletion: false)
let soundKickGBT_3 = SKAction.playSoundFileNamed("GBpulse3.wav", waitForCompletion: false) //bass
let soundKickGBT_4 = SKAction.playSoundFileNamed("GBpulse4.wav", waitForCompletion: false)
let soundKickGBT_5 = SKAction.playSoundFileNamed("GBpulse5.wav", waitForCompletion: false)
let soundKickGBT_6 = SKAction.playSoundFileNamed("GBpulse6.wav", waitForCompletion: false) //bass
let soundKickGBT_7 = SKAction.playSoundFileNamed("GBpulse7.wav", waitForCompletion: false)
let soundKickGBT_8 = SKAction.playSoundFileNamed("GBpulse8.wav", waitForCompletion: false)
let soundKickGBT_9 = SKAction.playSoundFileNamed("GBpulse9.wav", waitForCompletion: false) //bass
let soundKickGBT_10 = SKAction.playSoundFileNamed("GBpulse10.wav", waitForCompletion: false)

let soundSnareGBT_1 = SKAction.playSoundFileNamed("GBsnare1.wav", waitForCompletion: false)
let soundSnareGBT_2 = SKAction.playSoundFileNamed("GBsnare4.wav", waitForCompletion: false) //clap
let soundSnareGBT_3 = SKAction.playSoundFileNamed("GBsnare3.wav", waitForCompletion: false) // tight snare
let soundSnareGBT_4 = SKAction.playSoundFileNamed("GBsnare2.wav", waitForCompletion: false) // rimshot







class GameScene: SKScene {
    
 let wait1Beat = SKAction.wait(forDuration: 0.7)
    
    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
  //  let clockLabel = SKLabelNode(fontNamed: "Pusab")
    
    var timescore = Int()
    
    var gameArea = CGRect()
    
    override init(size: CGSize){
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: gameAreaMargin, y: CGFloat(0), width: playableWidth, height: size.height)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max:CGFloat) -> CGFloat {
        return random() * (max-min + min)
    }
    
    
    
    
    override func didMove(to view: SKView) {
        
        scoreNumber = 0
        scoreNumber2 = 0
        gameScore = 0
        
        backgroundColor = SKColor.white
        
        scoreLabel.fontSize = 15
        scoreLabel.text = "Score 0"
        scoreLabel.fontColor = SKColor.lightGray
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.95)
        self.addChild(scoreLabel)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
        
        if (scoreNumber+scoreNumber2) > highScoreNumber{
            highScoreNumber = (scoreNumber+scoreNumber2)
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
        
        let historicalLabel = SKLabelNode(fontNamed: "Pusab")
        historicalLabel.text = "Total \(historicalScoreNumber)"
        historicalLabel.fontSize = 15
        historicalLabel.fontColor = SKColor.lightGray
        historicalLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        historicalLabel.position = CGPoint(x: self.size.width*0.95, y: self.size.height*0.95)
        historicalLabel.zPosition = 1
        self.addChild(historicalLabel)

        
    /*  clockLabel.fontSize = 20
        clockLabel.text = "0"
        clockLabel.fontColor = SKColor.lightGray
        clockLabel.zPosition = 1
        clockLabel.position = CGPoint(x: self.size.width*0.15, y: self.size.height*0.95)
        self.addChild(clockLabel)
        
        
        let actionwait = SKAction.wait(forDuration: 1)
        var timesecond = Int()
        let actionrun = SKAction.run({
            self.timescore+=1
            timesecond+=1
            if timesecond == 60 {timesecond = 0}
            self.clockLabel.text = "\(self.timescore/60):\(timesecond)"
        })
        
        scoreLabel.run(SKAction.repeatForever(SKAction.sequence([actionwait,actionrun])))
    */
        
        
        run(SKAction.sequence([wait1Beat, SKAction.run(spawnNewDot), SKAction.run(clapPause)]))
        
        if userAudioDefault == 0 {
             run(soundKick808_1)
        } else if userAudioDefault == 1 {
            run(soundKickDD8_1)
        } else if userAudioDefault == 2 {
            run(soundKickGB_1)
        } else if userAudioDefault == 3 {
            run(soundKickGBT_1)
        }
    
    }
    

    
    func clapPause () {
        let wait2Beats = SKAction.wait(forDuration: 1.4) // 1.5 = 80bpm, 1.25 = 96bpm
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(spawnClapDot),
                wait2Beats
                ])
        ))
    }
    
    
    
    /* func hiHatLoop () {
        let hiHatPause = SKAction.wait(forDuration: 0.35)
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                soundHiHat808_1,
                hiHatPause
                ])
        ))
    } */
    
 
    

    
    
    func spawnNewDot(){
        // spawns a new dot whenever a dot is tapped
        
        var randomImageNumber = arc4random()%4
        randomImageNumber += 1
        
        let bassDot = SKSpriteNode(imageNamed: "dot\(randomImageNumber)")
        
        bassDot.zPosition = 2
        bassDot.setScale(0.25)
        bassDot.name = "dotObject"
        
        
        let randomX = random(min: gameArea.minX + bassDot.size.width, max: gameArea.maxX - bassDot.size.width)
        let randomY = random(min: gameArea.minY + bassDot.size.height, max: gameArea.maxY - bassDot.size.height)
        
        bassDot.position = CGPoint(x: randomX, y: randomY)
        self.addChild(bassDot)
        
        bassDot.run(SKAction.sequence([
            SKAction.scale(to: 0, duration: 3),
            soundGameOver808_1,
            SKAction.run(runnGameOver)
            ]))
        
    }
    
    func spawnClapDot() {
        // spawns a new dot whenever a dot is tapped
        var randomImageNumber = arc4random()%4
        randomImageNumber += 5
        
        let clapDot = SKSpriteNode(imageNamed: "dot\(randomImageNumber)")
    
        clapDot.zPosition = 3
        clapDot.setScale(0.25)
        clapDot.name = "ClapDot"
        
        let randomX = random(min: gameArea.minX + clapDot.size.width, max: gameArea.maxX - clapDot.size.width)
        let randomY = random(min: gameArea.minY + clapDot.size.height, max: gameArea.maxY - clapDot.size.height)
        
        clapDot.position = CGPoint(x: randomX, y: randomY)
        self.addChild(clapDot)
        
// userAudioDefault == 1
        
        if userAudioDefault == 1 {
        
        if scoreNumber2 < 8 {
            run(soundSnareDD8_1) }
        
        else if scoreNumber2 < 16 {

            run(soundSnareDD8_2)
        }
       
        else if scoreNumber2 < 24 {
            run(soundSnareDD8_3) }
            
        else if scoreNumber2 < 32 {
           run(soundSnareDD8_4)
        }
            
        else if scoreNumber2 < 40 {
            run(soundSnareDD8_3)
        }
        
        else if scoreNumber2 < 48 {
            run(soundSnareDD8_1)
        }
            
        else { run(soundSnareDD8_1) }
            
            if scoreNumber2 == 15 {
                run(SKAction.sequence([wait1Beat, soundStabDD8_1]))
            }
            
            else if scoreNumber2 == 31 {
                run(SKAction.sequence([wait1Beat, soundStabDD8_1]))
            }
            
            else if scoreNumber2 == 47 {
                run(SKAction.sequence([wait1Beat, soundStabDD8_1]))
            }
            
            
            
  // userAudioDefault == 2
            
        } else if userAudioDefault == 2 {
            
            
            if scoreNumber2 < 8 {
                run(soundSnareGB_1) }
                
            else if scoreNumber2 < 16 {
                
                run(soundSnareGB_2)
            }
                
            else if scoreNumber2 < 24 {
                run(soundSnareGB_3) }
                
            else if scoreNumber2 < 32 {
                run(soundSnareGB_4)
            }
                
            else if scoreNumber2 < 40 {
                run(soundSnareGB_3)
            }
                
            else if scoreNumber2 < 48 {
                run(soundSnareGB_1)
            }
                
            else { run(soundSnareGB_1) }
            
            if scoreNumber2 == 15 {
                run(SKAction.sequence([wait1Beat, soundStabGB_1]))
            }
            
            else if scoreNumber2 == 31 {
                run(SKAction.sequence([wait1Beat, soundStabGB_2]))
            }
            
            else if scoreNumber2 == 47 {
                run(SKAction.sequence([wait1Beat, soundStabGB_3]))
            }
            
// userAudioDefault == 3
            
        } else if userAudioDefault == 3 {
            
            
            if scoreNumber2 < 8 {
                run(soundSnareGB_1)
            }
                
            else if scoreNumber2 < 16 {
                
                run(soundSnareGB_2)
            }
                
            else if scoreNumber2 < 24 {
                run(soundSnareGB_1) }
                
            else if scoreNumber2 < 32 {
                run(soundSnareGB_2)
            }
                
            else if scoreNumber2 < 40 {
                run(soundSnareGB_1)
            }
                
            else if scoreNumber2 < 48 {
                run(soundSnareGB_2)
            }
                
            else { run(soundSnareGB_1)
            }
            
            if scoreNumber2 == 15 {
                run(SKAction.sequence([wait1Beat, soundStabGB_1]))
            }
            
            else if scoreNumber2 == 31 {
                run(SKAction.sequence([wait1Beat, soundStabGB_2]))
            }
            
            else if scoreNumber2 == 47 {
                run(SKAction.sequence([wait1Beat, soundStabGB_3]))
            }
            
            
  
// userAudioDefault == 0
        } else if userAudioDefault == 0 {
            
            if scoreNumber2 < 8 {
                run(soundSnare808_1) }
                
            else if scoreNumber2 < 16 {
                
                run(soundSnare808_2)
            }
                
            else if scoreNumber2 < 24 {
                run(soundSnare808_1) }
                
            else if scoreNumber2 < 32 {
                run(soundSnare808_4)
            }
                
            else if scoreNumber2 < 40 {
                run(soundSnare808_3)
            }
                
            else if scoreNumber2 < 48 {
                run(soundSnare808_1)
            }
                
            else { run(soundSnare808_2) }
            
            
            if scoreNumber2 == 15 {
                run(SKAction.sequence([wait1Beat, soundStab1]))
            }
            
           else if scoreNumber2 == 31 {
                run(SKAction.sequence([wait1Beat, soundStab1]))
            }
            
            else if scoreNumber2 == 47 {
                run(SKAction.sequence([wait1Beat, soundStab1]))
            }
        
        }
        
        
        clapDot.run(SKAction.sequence([
            SKAction.scale(to: 0, duration: 3),
            soundGameOver808_1,
            SKAction.run(runnGameOver)
            ]))
        
        
        
    }
    
    func runnGameOver(){
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.doorsOpenVertical(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var randomAudioNumber = Int(arc4random_uniform(10))
        //var randomAudioNumber = arc4random()%4
        randomAudioNumber += 1
   
        // Game Boy 8-bit tones
        let soundKickGBT_Random = SKAction.playSoundFileNamed("GBpulse\(randomAudioNumber).wav", waitForCompletion: false)


        
        for touch: AnyObject in touches {
            
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            
            if nameOfTappedNode == "dotObject"{
                
                tappedNode.name = ""
                tappedNode.removeAllActions()
                
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                    ]))
  
// userAudioDefault == 1
                
            if userAudioDefault == 1 {
                
                if scoreNumber2 < 8 {
                    run(soundKickDD8_1)
                }
                
                else if scoreNumber2 < 16 {
                    run(soundKickDD8_3) }
                    
                else if scoreNumber2 < 24 {
                    run(soundKickDD8_1) }
                    
                else if scoreNumber2 < 32 {
                    run(soundKickDD8_1) }
                    
                else {
                    run(soundKickDD8_3) }
                
                
// userAudioDefault == 2
                
            } else if userAudioDefault == 2 {
                
                if scoreNumber2 < 8 {
                    run(soundKickGB_1) }
                    
                else if scoreNumber2 < 16 {
                    run(soundKickGB_3) }
                    
                else if scoreNumber2 < 24 {
                    run(soundKickGB_4) }
                    
                else if scoreNumber2 < 32 {
                    run(soundKickGB_1) }
                    
                else {
                    run(soundKickGB_3) }
                
                
// userAudioDefault == 3
                
            } else if userAudioDefault == 3 {
                    run(soundKickGBT_Random)
                    run(soundKickDD8_1)
 
                
                
 // userAudioDefault == 0
                
            } else if userAudioDefault == 0 {
                    
                    
                    if scoreNumber2 < 8 {
                        run(soundKick808_1) }
                        
                    else if scoreNumber2 < 16 {
                        run(soundKick808_3) }
                        
                    else if scoreNumber2 < 24 {
                        run(soundKick808_1) }
                        
                    else if scoreNumber2 < 32 {
                        run(soundKick808_1) }
                        
                    else {
                        run(soundKick808_3) }
                    
                }
                
                spawnNewDot()
                
                
                scoreNumber += 1
                gameScore += 1
                scoreLabel.text = "Score \(gameScore)"
                
                
                if gameScore == 50 || gameScore == 100 || gameScore == 200  || gameScore == 300 || gameScore == 400 {
                    
                    spawnNewDot()
                }
                
        
        
            } else if nameOfTappedNode == "ClapDot"{
                
                tappedNode.name = ""
                tappedNode.removeAllActions()
                
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                    ]))
                
// userAudioDefault == 1
                
                if userAudioDefault == 1 {
                    
                if scoreNumber2 < 7 {
                    run(soundKickDD8_1) }
                    
                else if scoreNumber2 < 15 {
                    run(soundKickDD8_3) }
                    
                else if scoreNumber2 < 23 {
                    run(soundKickDD8_1) }
                    
                else if scoreNumber2 < 31 {
                    run(soundKickDD8_1) }
                    
                else {
                    run(soundKickDD8_3) }
                    
// userAudioDefault == 2
                    
                } else if userAudioDefault == 2 {
                    
                    if scoreNumber2 < 7 {
                        run(soundKickGB_1) }
                        
                    else if scoreNumber2 < 15 {
                        run(soundKickGB_3) }
                        
                    else if scoreNumber2 < 23 {
                        run(soundKickGB_4) }
                        
                    else if scoreNumber2 < 31 {
                        run(soundKickGB_1) }
                        
                    else {
                        run(soundKickGB_3) }
                    
// userAudioDefault == 3
                    
                } else if userAudioDefault == 3 {
                    run(soundKickGBT_Random)
                    run(soundKickDD8_1)


// userAudioDefault == 0

                } else if userAudioDefault == 0 {
                    
                    if scoreNumber2 < 7 {
                        run(soundKick808_1) }
                        
                    else if scoreNumber2 < 15 {
                        run(soundKick808_3) }
                        
                    else if scoreNumber2 < 23 {
                        run(soundKick808_1) }
                        
                    else if scoreNumber2 < 31 {
                        run(soundKick808_1) }
                        
                    else {
                        run(soundKick808_3) }
                }
                
                //  spawnNewDot()
                
                
                scoreNumber2 += 1
                gameScore += 1
                scoreLabel.text = "Score \(gameScore)"
                
            }
            
        }
    }
}
