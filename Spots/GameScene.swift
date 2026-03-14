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

// Starting BPM — increases by 5% every 32 taps (see checkTempoAndFills)
let startingBPM: Double = 86.0

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

    let scoreLabel   = SKLabelNode(fontNamed: "Pusab")
    let totalLabel   = SKLabelNode(fontNamed: "Pusab")  // taps this game; updates live
    var gameArea = CGRect()

    // Live BPM — starts at 86, increases 5% every 32 taps.
    // All timing (beat, dotLifetime, hi-hat loop) derives from this.
    var currentBPM: Double = startingBPM

    // One beat in seconds at the current tempo
    var beat: Double { 60.0 / currentBPM }

    // How long a dot stays on screen before triggering game over.
    // Shrinks automatically as BPM rises — the sole difficulty driver.
    var dotLifetime: Double { beat * 2.0 }

    // Total taps this game — drives tempo progression and fills.
    var tapCount = 0

    // 16-step hi-hat counter (0–15 = one bar of 16th notes).
    // Steps 0,2,4,6,8,10,12 → closed hat (8th notes).
    // Step 14 → open hat ("and" of beat 4 — groove pocket).
    // Odd steps → silence (keeps the pattern crisp, not cluttered).
    var hhStep: Int = 0

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
        tapCount = 0
        hhStep = 0
        currentBPM = startingBPM

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

        totalLabel.text = "Total 0"
        totalLabel.fontSize = 15
        totalLabel.fontColor = SKColor.lightGray
        totalLabel.horizontalAlignmentMode = .right
        totalLabel.position = CGPoint(x: self.size.width * 0.95, y: self.size.height * 0.95)
        totalLabel.zPosition = 1
        addChild(totalLabel)

        // Intro kick establishes the tempo; hi-hat + first dots launch one beat later.
        playKickSound()
        run(SKAction.sequence([
            SKAction.wait(forDuration: beat),
            SKAction.run {
                self.startRhythm()
                self.spawnBassDot()
                self.spawnClapDot()
            }
        ]))
    }

    // Starts (or re-syncs) the hi-hat loop at the current BPM.
    //
    // Bass and clap dots are now player-driven: tapping a dot immediately
    // spawns the next one, so the player chooses their own subdivision
    // (quarter notes, eighth notes, etc.) and their taps ARE the beat.
    //
    // The hi-hat provides the tempo grid to groove against. It restarts
    // with an optional delay so tempo-increase re-syncs feel smooth.
    //
    // run(_:withKey:) replaces any existing loop with the same key,
    // so no explicit removal is needed before calling this.
    func startRhythm(delay: Double = 0) {
        let hhLoop = SKAction.repeatForever(SKAction.sequence([
            SKAction.run(playHiHatSound),
            SKAction.wait(forDuration: beat / 4)
        ]))
        run(SKAction.sequence([
            SKAction.wait(forDuration: delay),
            hhLoop
        ]), withKey: "hiHatLoop")
    }

    // Bumps BPM by 5% and re-syncs the hi-hat at the new tempo.
    // Called every 32 taps via checkTempoAndFills().
    func increaseTempo() {
        currentBPM *= 1.05
        startRhythm(delay: beat)
    }

    // Bass dot — tap it to sound the kick and immediately get the next one.
    // No sound on spawn: the player's tap timing IS the kick pattern.
    // Miss (dot shrinks to zero) → game over.
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

    // Clap dot — tap it to sound the snare and immediately get the next one.
    // No sound on spawn: the player's tap timing IS the snare pattern.
    // Miss → game over.
    func spawnClapDot() {
        let clapDot = SKSpriteNode(imageNamed: "dot\(Int.random(in: 5...8))")
        clapDot.zPosition = 3
        clapDot.setScale(0.25)
        clapDot.name = "ClapDot"
        clapDot.position = randomPosition(for: clapDot)
        addChild(clapDot)

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

    // 16-step hi-hat pattern — fires every 16th note (beat/4).
    //
    //  Step: 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
    //  Beat: 1  .  +  .  2  .  +  .  3  .  +  .  4  .  +  .
    //
    //  0,2,4,6,8,10,12 → closed hi-hat (steady 8th-note pulse)
    //  14              → open hi-hat ("and" of beat 4 — the groove pocket)
    //  odd steps       → silence (crisp gaps between 8th notes)
    //
    // The player controls all kick and snare timing through taps,
    // so no automated kick fires here — only the hi-hat backdrop.
    func playHiHatSound() {
        let step = hhStep
        hhStep = (hhStep + 1) % 16

        switch step {
        case 0, 2, 4, 6, 8, 10, 12:
            playClosedHat()
        case 14:
            playOpenHat()
        default:
            break   // silence on 16th-note off-steps
        }
    }

    // Closed hi-hat — the steady 8th-note backbone
    func playClosedHat() {
        switch userAudioDefault {
        case 1:  run(soundHiHatDD8_1)
        default: run(soundHiHat808_1)
        }
    }

    // Open hi-hat — fires on step 14 ("and" of beat 4) for groove pocket
    func playOpenHat() {
        switch userAudioDefault {
        case 1:  run(soundHiHatDD8_2)   // DD-8 crash as open hat
        default: run(soundHiHat808_2)   // 808 open hat
        }
    }

    // Kick sound for the active drum kit.
    // Cycles every 8 bass taps to keep the sound progression interesting.
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

    // Checks whether the current tap count should trigger a tempo increase
    // or a tom fill, and fires the appropriate event.
    // Called after every successful tap in touchesBegan.
    func checkTempoAndFills() {
        // Increase tempo every 32 taps (+5% BPM)
        if tapCount % 32 == 0 {
            increaseTempo()
        }
        // Tom fill at tap 16, 48, 80… (midway between tempo bumps)
        if tapCount % 16 == 0 && tapCount % 32 != 0 {
            playTomFill()
        }
    }

    // Tom fill — 3 rapid hits that burst immediately on the trigger tap.
    // Fires every 16 taps (between the 32-tap tempo bumps) as a musical
    // accent marking each mini-phrase boundary.
    func playTomFill() {
        let fillSound: SKAction
        switch userAudioDefault {
        case 1:  fillSound = soundSnareDD8_3   // DD-8 rim as fill
        case 2:  fillSound = soundSnareGB_3    // GB snare variant as fill
        case 3:  fillSound = soundSnareGB_3
        default: fillSound = soundTom808_1     // 808 tom for a proper fill
        }

        run(SKAction.sequence([
            fillSound,
            SKAction.wait(forDuration: beat * 0.125),
            fillSound,
            SKAction.wait(forDuration: beat * 0.125),
            fillSound
        ]))
    }

    // Snare/clap sound for the active drum kit.
    // Cycles through snare variants every 8 clap taps; stab accents fire
    // at every 16th clap tap as a phrase-turnaround flourish.
    func playClapSound() {
        let bar = (scoreNumber2 / 8) % 6
        let isPhraseTurnaround = scoreNumber2 % 16 == 15

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
                run(SKAction.sequence([SKAction.wait(forDuration: beat), stabs[(scoreNumber2 / 16) % 3]]))
            }
        case 3:
            let snares = [soundSnareGB_1, soundSnareGB_2, soundSnareGB_1,
                          soundSnareGB_2, soundSnareGB_1, soundSnareGB_2]
            run(snares[bar])
            if isPhraseTurnaround {
                let stabs = [soundStabGB_1, soundStabGB_2, soundStabGB_3]
                run(SKAction.sequence([SKAction.wait(forDuration: beat), stabs[(scoreNumber2 / 16) % 3]]))
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

                // Tap IS the kick — sound plays now, driven entirely by the player.
                // Spawn the next bass dot immediately so they can keep their groove.
                scoreNumber += 1
                gameScore += 1
                tapCount += 1
                scoreLabel.text = "Score \(gameScore)"
                totalLabel.text  = "Total \(gameScore)"
                playKickSound()
                spawnBassDot()
                checkTempoAndFills()

            } else if nameOfTappedNode == "ClapDot" {
                tappedNode.name = ""
                tappedNode.removeAllActions()
                tappedNode.run(SKAction.sequence([
                    SKAction.fadeOut(withDuration: 0.1),
                    SKAction.removeFromParent()
                ]))

                // Tap IS the snare — sound plays now, driven entirely by the player.
                // Spawn the next clap dot immediately so they can keep their groove.
                scoreNumber2 += 1
                gameScore += 1
                tapCount += 1
                scoreLabel.text = "Score \(gameScore)"
                totalLabel.text  = "Total \(gameScore)"
                playClapSound()
                spawnClapDot()
                checkTempoAndFills()
            }
        }
    }
}
