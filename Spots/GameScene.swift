//
//  GameScene.swift
//  Dotaro
//
//  Created by Roger Westfall on 12/23/16.
//  Copyright © 2016 Roger Westfall. All rights reserved.
//

import SpriteKit
import GameplayKit

// Drum kit selection:
// 0 (default) = Roland TR-808
// 1 = Yamaha DD-8
// 2 = Gameboy 8-bit drums
// 3 = Gameboy 8-bit tones

var scoreNumber = 0
var scoreNumber2 = 0
var gameScore = 0

// BPM — all game timing is derived from this value.
// Dots appear on beats 1 & 3 (bass) and beats 2 & 4 (clap),
// so tapping in time creates an actual drum groove.
let bpm: Double = 100.0

// 808 Audio
let soundKick808_1 = SKAction.playSoundFileNamed("kick4.wav", waitForCompletion: false)
let soundKick808_2 = SKAction.playSoundFileNamed("kick2.wav", waitForCompletion: false)
let soundKick808_3 = SKAction.playSoundFileNamed("kick3.wav", waitForCompletion: false)
let soundKick808_4 = SKAction.playSoundFileNamed("808-Kicks09.wav", waitForCompletion: false)

let soundSnare808_1 = SKAction.playSoundFileNamed("snare1.wav", waitForCompletion: false)
let soundSnare808_2 = SKAction.playSoundFileNamed("snare2.wav", waitForCompletion: false)
let soundSnare808_3 = SKAction.playSoundFileNamed("snare3.wav", waitForCompletion: false)
let soundSnare808_4 = SKAction.playSoundFileNamed("snare4.wav", waitForCompletion: false)

let soundHiHat808_1 = SKAction.playSoundFileNamed("hiHat1.WAV", waitForCompletion: false)
let soundHiHat808_2 = SKAction.playSoundFileNamed("hiHat2.WAV", waitForCompletion: false)
let soundCowbell808_1 = SKAction.playSoundFileNamed("808-Cowbell1.wav", waitForCompletion: false)
let soundMaracas808_1 = SKAction.playSoundFileNamed("808-Maracas1.wav", waitForCompletion: false)
let soundTom808_1 = SKAction.playSoundFileNamed("tom.wav", waitForCompletion: false)
let soundGameOver808_1 = SKAction.playSoundFileNamed("bass21.wav", waitForCompletion: false)
let soundStab1 = SKAction.playSoundFileNamed("Famoush.wav", waitForCompletion: false)

// Yamaha DD-8
let soundKickDD8_1 = SKAction.playSoundFileNamed("DD8kick1.wav", waitForCompletion: false)
let soundKickDD8_2 = SKAction.playSoundFileNamed("DD8kick3.wav", waitForCompletion: false)
let soundKickDD8_3 = SKAction.playSoundFileNamed("DD8kick2.wav", waitForCompletion: false)
let soundKickDD8_4 = SKAction.playSoundFileNamed("DD8kick1.wav", waitForCompletion: false)

let soundSnareDD8_1 = SKAction.playSoundFileNamed("DD8snare1.wav", waitForCompletion: false)
let soundSnareDD8_2 = SKAction.playSoundFileNamed("DD8snare2.wav", waitForCompletion: false)
let soundSnareDD8_3 = SKAction.playSoundFileNamed("DD8snare3.wav", waitForCompletion: false)
let soundSnareDD8_4 = SKAction.playSoundFileNamed("DD8snap.wav", waitForCompletion: false)

let soundHiHatDD8_1 = SKAction.playSoundFileNamed("DD8hihat.wav", waitForCompletion: false)
let soundHiHatDD8_2 = SKAction.playSoundFileNamed("DD8crash.wav", waitForCompletion: false)

let soundStabDD8_1 = SKAction.playSoundFileNamed("DD8stab.wav", waitForCompletion: false)
let soundStabDD8_2 = SKAction.playSoundFileNamed("DD8cat.wav", waitForCompletion: false)
let soundStabDD8_3 = SKAction.playSoundFileNamed("DD8dawg.wav", waitForCompletion: false)

// Game Boy 8-bit
let soundKickGB_1 = SKAction.playSoundFileNamed("GBkick3.wav", waitForCompletion: false)
let soundKickGB_2 = SKAction.playSoundFileNamed("GBkick3.wav", waitForCompletion: false)
let soundKickGB_3 = SKAction.playSoundFileNamed("GBkick3.wav", waitForCompletion: false)
let soundKickGB_4 = SKAction.playSoundFileNamed("GBkick4.wav", waitForCompletion: false)

let soundSnareGB_1 = SKAction.playSoundFileNamed("GBsnare1.wav", waitForCompletion: false)
let soundSnareGB_2 = SKAction.playSoundFileNamed("GBsnare4.wav", waitForCompletion: false)
let soundSnareGB_3 = SKAction.playSoundFileNamed("GBsnare3.wav", waitForCompletion: false)
let soundSnareGB_4 = SKAction.playSoundFileNamed("GBsnare2.wav", waitForCompletion: false)

let soundStabGB_1 = SKAction.playSoundFileNamed("GBarp3.wav", waitForCompletion: false)
let soundStabGB_2 = SKAction.playSoundFileNamed("GBarp2.wav", waitForCompletion: false)
let soundStabGB_3 = SKAction.playSoundFileNamed("GBarp1.wav", waitForCompletion: false)

// Game Boy 8-bit tones
let soundKickGBT_1  = SKAction.playSoundFileNamed("GBpulse1.wav",  waitForCompletion: false)
let soundKickGBT_2  = SKAction.playSoundFileNamed("GBpulse2.wav",  waitForCompletion: false)
let soundKickGBT_3  = SKAction.playSoundFileNamed("GBpulse3.wav",  waitForCompletion: false)
let soundKickGBT_4  = SKAction.playSoundFileNamed("GBpulse4.wav",  waitForCompletion: false)
let soundKickGBT_5  = SKAction.playSoundFileNamed("GBpulse5.wav",  waitForCompletion: false)
let soundKickGBT_6  = SKAction.playSoundFileNamed("GBpulse6.wav",  waitForCompletion: false)
let soundKickGBT_7  = SKAction.playSoundFileNamed("GBpulse7.wav",  waitForCompletion: false)
let soundKickGBT_8  = SKAction.playSoundFileNamed("GBpulse8.wav",  waitForCompletion: false)
let soundKickGBT_9  = SKAction.playSoundFileNamed("GBpulse9.wav",  waitForCompletion: false)
let soundKickGBT_10 = SKAction.playSoundFileNamed("GBpulse10.wav", waitForCompletion: false)

let soundSnareGBT_1 = SKAction.playSoundFileNamed("GBsnare1.wav", waitForCompletion: false)
let soundSnareGBT_2 = SKAction.playSoundFileNamed("GBsnare4.wav", waitForCompletion: false)
let soundSnareGBT_3 = SKAction.playSoundFileNamed("GBsnare3.wav", waitForCompletion: false)
let soundSnareGBT_4 = SKAction.playSoundFileNamed("GBsnare2.wav", waitForCompletion: false)


class GameScene: SKScene {

    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
    var gameArea = CGRect()

    // One beat in seconds — everything is derived from this
    var beat: Double { 60.0 / bpm }

    // Dot lifetime decreases as score rises, making the game progressively harder
    var dotLifetime: Double {
        switch gameScore {
        case 0..<50:    return beat * 2.0   // 1.2 s at 100 BPM
        case 50..<150:  return beat * 1.75  // 1.05 s
        case 150..<300: return beat * 1.5   // 0.9 s
        default:        return beat * 1.25  // 0.75 s — very tight
        }
    }

    // Tracks how many clap dots have spawned (drives sound cycling & stab accents,
    // independent of the player's tap count so the beat never drifts)
    var clapSpawnCount = 0

    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = 16.0 / 9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        scoreNumber = 0
        scoreNumber2 = 0
        gameScore = 0
        clapSpawnCount = 0

        backgroundColor = SKColor.white

        scoreLabel.fontSize = 15
        scoreLabel.text = "Score 0"
        scoreLabel.fontColor = SKColor.lightGray
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.95)
        addChild(scoreLabel)

        let defaults = UserDefaults.standard
        let highScoreNumber = defaults.integer(forKey: "highScoreSaved")

        let highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScoreLabel.text = "High \(highScoreNumber)"
        highScoreLabel.fontSize = 15
        highScoreLabel.fontColor = SKColor.lightGray
        highScoreLabel.horizontalAlignmentMode = .left
        highScoreLabel.position = CGPoint(x: self.size.width * 0.05, y: self.size.height * 0.95)
        highScoreLabel.zPosition = 1
        addChild(highScoreLabel)

        let historicalLabel = SKLabelNode(fontNamed: "Pusab")
        historicalLabel.text = "Total \(historicalScoreNumber)"
        historicalLabel.fontSize = 15
        historicalLabel.fontColor = SKColor.lightGray
        historicalLabel.horizontalAlignmentMode = .right
        historicalLabel.position = CGPoint(x: self.size.width * 0.95, y: self.size.height * 0.95)
        historicalLabel.zPosition = 1
        addChild(historicalLabel)

        // Intro kick on beat 1 establishes the tempo, then the pattern kicks in
        playKickSound()
        run(SKAction.sequence([
            SKAction.wait(forDuration: beat),
            SKAction.run(startRhythm)
        ]))
    }

    // Sets up a 4/4 kick-snare pattern:
    //   Bass dots  → beats 1 & 3  (every 2 beats)
    //   Clap dots  → beats 2 & 4  (every 2 beats, offset by 1 beat)
    //
    // When the player taps bass dots in time they hear the kick on beats 1 & 3.
    // The snare fires automatically on clap-dot spawn (beats 2 & 4) as the
    // beat reference. Together they form a real drum groove.
    func startRhythm() {
        let bassLoop = SKAction.repeatForever(SKAction.sequence([
            SKAction.run(spawnBassDot),
            SKAction.wait(forDuration: beat * 2)
        ]))
        run(bassLoop, withKey: "bassLoop")

        let clapLoop = SKAction.repeatForever(SKAction.sequence([
            SKAction.run(spawnClapDot),
            SKAction.wait(forDuration: beat * 2)
        ]))
        // Offset by 1 beat so clap lands on beats 2 & 4
        run(SKAction.sequence([
            SKAction.wait(forDuration: beat),
            clapLoop
        ]), withKey: "clapLoop")
    }

    // Bass (kick) dot — appears on beats 1 & 3.
    // Player tap → kick sound plays + score.  Miss → game over.
    func spawnBassDot() {
        let dot = SKSpriteNode(imageNamed: "dot\(Int.random(in: 1...4))")
        dot.zPosition = 2
        dot.setScale(0.25)
        dot.name = "dotObject"
        dot.position = randomPosition(for: dot)
        addChild(dot)

        dot.run(SKAction.sequence([
            SKAction.scale(to: 0, duration: dotLifetime),
            SKAction.run(runnGameOver)
        ]))
    }

    // Clap (snare) dot — appears on beats 2 & 4.
    // Snare fires on spawn so the beat is audible regardless of tap timing.
    // Player tap → score (no extra sound; the groove is already playing).
    // Miss → game over.
    func spawnClapDot() {
        clapSpawnCount += 1

        let clapDot = SKSpriteNode(imageNamed: "dot\(Int.random(in: 5...8))")
        clapDot.zPosition = 3
        clapDot.setScale(0.25)
        clapDot.name = "ClapDot"
        clapDot.position = randomPosition(for: clapDot)
        addChild(clapDot)

        // Snare fires on spawn — this is the beat the player grooves to
        playClapSound()

        clapDot.run(SKAction.sequence([
            SKAction.scale(to: 0, duration: dotLifetime),
            SKAction.run(runnGameOver)
        ]))
    }

    func randomPosition(for node: SKSpriteNode) -> CGPoint {
        let x = CGFloat.random(in: (gameArea.minX + node.size.width)...(gameArea.maxX - node.size.width))
        let y = CGFloat.random(in: (gameArea.minY + node.size.height)...(gameArea.maxY - node.size.height))
        return CGPoint(x: x, y: y)
    }

    // Kick sound for the active drum kit.
    // Sound cycles every 8 bass taps to keep the progression musical.
    func playKickSound() {
        switch userAudioDefault {
        case 1:
            let kicks = [soundKickDD8_1, soundKickDD8_3, soundKickDD8_1, soundKickDD8_1, soundKickDD8_3]
            run(kicks[(scoreNumber / 8) % kicks.count])
        case 2:
            let kicks = [soundKickGB_1, soundKickGB_3, soundKickGB_4, soundKickGB_1, soundKickGB_3]
            run(kicks[(scoreNumber / 8) % kicks.count])
        case 3:
            // Game Boy tones: random pulse on every hit for melodic variation
            run(SKAction.playSoundFileNamed("GBpulse\(Int.random(in: 1...10)).wav", waitForCompletion: false))
        default:
            let kicks = [soundKick808_1, soundKick808_3, soundKick808_1, soundKick808_1, soundKick808_3]
            run(kicks[(scoreNumber / 8) % kicks.count])
        }
    }

    // Snare/clap sound for the active drum kit.
    // Sound cycles every 8 clap-dot spawns; stab accents every 16th beat
    // (phrase turnaround) to give the music structure.
    func playClapSound() {
        let bar = (clapSpawnCount / 8) % 6
        let isPhraseTurnaround = clapSpawnCount % 16 == 15

        switch userAudioDefault {
        case 1:
            let snares = [soundSnareDD8_1, soundSnareDD8_2, soundSnareDD8_3,
                          soundSnareDD8_4, soundSnareDD8_3, soundSnareDD8_1]
            run(snares[bar])
            if isPhraseTurnaround {
                run(SKAction.sequence([SKAction.wait(forDuration: beat), soundStabDD8_1]))
            }
        case 2:
            let snares = [soundSnareGB_1, soundSnareGB_2, soundSnareGB_3,
                          soundSnareGB_4, soundSnareGB_3, soundSnareGB_1]
            run(snares[bar])
            if isPhraseTurnaround {
                let stabs = [soundStabGB_1, soundStabGB_2, soundStabGB_3]
                run(SKAction.sequence([SKAction.wait(forDuration: beat), stabs[(clapSpawnCount / 16) % 3]]))
            }
        case 3:
            let snares = [soundSnareGB_1, soundSnareGB_2, soundSnareGB_1,
                          soundSnareGB_2, soundSnareGB_1, soundSnareGB_2]
            run(snares[bar])
            if isPhraseTurnaround {
                let stabs = [soundStabGB_1, soundStabGB_2, soundStabGB_3]
                run(SKAction.sequence([SKAction.wait(forDuration: beat), stabs[(clapSpawnCount / 16) % 3]]))
            }
        default:
            let snares = [soundSnare808_1, soundSnare808_2, soundSnare808_1,
                          soundSnare808_4, soundSnare808_3, soundSnare808_1]
            run(snares[bar])
            if isPhraseTurnaround {
                run(SKAction.sequence([SKAction.wait(forDuration: beat), soundStab1]))
            }
        }
    }

    func runnGameOver() {
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.doorsOpenVertical(withDuration: 0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let positionOfTouch = touch.location(in: self)
            let tappedNode = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name

            if nameOfTappedNode == "dotObject" {
                tappedNode.name = ""
                tappedNode.removeAllActions()
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                ]))

                // Kick on tap — the player IS the kick drum
                playKickSound()

                scoreNumber += 1
                gameScore += 1
                scoreLabel.text = "Score \(gameScore)"

            } else if nameOfTappedNode == "ClapDot" {
                tappedNode.name = ""
                tappedNode.removeAllActions()
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                ]))

                // Snare already played on spawn; no extra sound keeps the groove clean
                scoreNumber2 += 1
                gameScore += 1
                scoreLabel.text = "Score \(gameScore)"
            }
        }
    }
}
