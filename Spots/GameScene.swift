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

// Starting BPM — increases by 5% every 16 bars (see GameScene.increaseTempo)
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

    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
    var gameArea = CGRect()

    // Live BPM — starts at 86, increases 5% every 16 bars.
    // All timing (beat, dotLifetime, loop waits) derives from this.
    var currentBPM: Double = startingBPM

    // One beat in seconds at the current tempo
    var beat: Double { 60.0 / currentBPM }

    // Each dot must be tapped within 2 beats.
    // As BPM rises the window shrinks in real time, making the game harder.
    var dotLifetime: Double { beat * 2.0 }

    // Tracks how many clap dots have spawned (drives sound cycling, stab accents,
    // and tempo increases — independent of player taps so the beat never drifts).
    var clapSpawnCount = 0

    // 16-step hi-hat counter (0–15 = one bar of 16th notes).
    // Steps 0,2,4,6,8,10,12 → closed hat (8th notes).
    // Step 14 → open hat + anticipation kick ("and" of beat 4 — the groove's pocket).
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
        clapSpawnCount = 0
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
            SKAction.run { self.startRhythm() }
        ]))
    }

    // Sets up (or re-syncs) the full 4/4 drum pattern at the current BPM:
    //
    //   Bass dots  → beats 1 & 3  — kick fires on spawn
    //   Clap dots  → beats 2 & 4  — snare fires on spawn
    //   Hi-hat     → 16th-note loop (beat / 4), step counter picks sound per step
    //
    // `bassDelay` lets the caller re-sync loops mid-song after a tempo change.
    // When called from beat 2 (clap spawn), pass `beat` so bass re-enters on
    // beat 3 and clap re-enters on beat 4, keeping the pattern properly aligned.
    //
    // run(_:withKey:) automatically replaces any existing action with the same key,
    // so there is no need to remove old loops before calling this.
    func startRhythm(bassDelay: Double = 0) {
        let bassLoop = SKAction.repeatForever(SKAction.sequence([
            SKAction.run(spawnBassDot),
            SKAction.wait(forDuration: beat * 2)
        ]))
        run(SKAction.sequence([
            SKAction.wait(forDuration: bassDelay),
            bassLoop
        ]), withKey: "bassLoop")

        let clapLoop = SKAction.repeatForever(SKAction.sequence([
            SKAction.run(spawnClapDot),
            SKAction.wait(forDuration: beat * 2)
        ]))
        // Clap is always 1 beat after bass (beats 2 & 4)
        run(SKAction.sequence([
            SKAction.wait(forDuration: bassDelay + beat),
            clapLoop
        ]), withKey: "clapLoop")

        // Hi-hat on every 16th note — step counter decides which sound fires.
        // Running at beat/4 lets us put the open hat and anticipation kick
        // precisely on step 14 ("and" of beat 4) for syncopation.
        // Delayed by bassDelay so the pattern re-syncs cleanly on tempo bumps.
        let hhLoop = SKAction.repeatForever(SKAction.sequence([
            SKAction.run(playHiHatSound),
            SKAction.wait(forDuration: beat / 4)
        ]))
        run(SKAction.sequence([
            SKAction.wait(forDuration: bassDelay),
            hhLoop
        ]), withKey: "hiHatLoop")
    }

    // Called every 16 bars (32 clap spawns). Bumps BPM by 5% and restarts
    // all loops at the new tempo, re-synced to the current beat position.
    // We are always on beat 2 when this fires (clap spawn), so the bass
    // re-enters 1 beat later on beat 3 to stay in the correct 4/4 pattern.
    func increaseTempo() {
        currentBPM *= 1.05
        startRhythm(bassDelay: beat)
    }

    // Bass (kick) dot — appears on beats 1 & 3.
    // Kick fires on spawn so beat 1 & 3 are always locked to tempo.
    // Player tap → score + visual removal.  Miss → game over.
    func spawnBassDot() {
        // Kick fires on the beat — guaranteed, regardless of tap timing
        playKickSound()

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

        // Every 16 bars (32 clap spawns = 64 beats) increase BPM by 5%.
        // This fires on beat 2, so increaseTempo() re-syncs bass to beat 3.
        if clapSpawnCount % 32 == 0 {
            increaseTempo()
        }

        // Tom fill every 8 bars (16 clap spawns) — but NOT on the same bar
        // as a tempo increase (bar 16, 32…) since that's already eventful.
        // Fires on beat 4, so the fill lands between beat 4 and bar 1.
        if clapSpawnCount % 16 == 0 && clapSpawnCount % 32 != 0 {
            playTomFill()
        }

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

    // 16-step hi-hat pattern — fires every 16th note (beat/4).
    //
    //  Step: 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
    //  Beat: 1  .  +  .  2  .  +  .  3  .  +  .  4  .  +  .
    //
    //  0,2,4,6,8,10,12 → closed hi-hat (the steady 8th-note pulse)
    //  14              → open hi-hat + anticipation kick ("and" of beat 4)
    //  odd steps       → silence (crisp gaps between 8th notes)
    //
    // The open hat + anticipation kick on step 14 is the classic hip-hop
    // pocket move — it creates forward momentum into beat 1.
    func playHiHatSound() {
        let step = hhStep
        hhStep = (hhStep + 1) % 16

        switch step {
        case 0, 2, 4, 6, 8, 10, 12:
            playClosedHat()
        case 14:
            playOpenHat()
            playAnticipationKick()
        default:
            break   // silence on 16th-note off-steps
        }
    }

    // Closed hi-hat — the steady 8th-note backbone
    func playClosedHat() {
        switch userAudioDefault {
        case 1:  run(soundHiHatDD8_1)
        default: run(soundHiHat808_1)   // 808 closed hat for all other kits
        }
    }

    // Open hi-hat — fires only on step 14 ("and" of beat 4)
    func playOpenHat() {
        switch userAudioDefault {
        case 1:  run(soundHiHatDD8_2)   // DD-8 crash as open hat
        default: run(soundHiHat808_2)   // 808 open hat
        }
    }

    // Anticipation kick — fires on "and" of beat 4 alongside the open hat.
    // Uses a different kick sample than the main beat kick so it sits
    // underneath rather than competing with beats 1 & 3.
    func playAnticipationKick() {
        switch userAudioDefault {
        case 1:  run(soundKickDD8_2)
        case 2:  run(soundKickGB_4)
        case 3:  run(SKAction.playSoundFileNamed("GBpulse\(Int.random(in: 1...10)).wav", waitForCompletion: false))
        default: run(soundKick808_4)    // 808-Kicks09 — lighter than the main kick
        }
    }

    // Kick sound for the active drum kit.
    // Sound cycles every 8 bass spawns to keep the progression musical.
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

    // Tom fill — 3 quick hits leading from beat 4 into beat 1 of the next bar.
    // Fires every 8 bars (not on the 16-bar tempo-bump bars).
    // Timing: starts on beat 4 "+", landing on beat 4 "a" and beat 1 (with kick).
    // The final tom on beat 1 doubles the kick for a satisfying crash-landing.
    func playTomFill() {
        let fillSound: SKAction
        switch userAudioDefault {
        case 1:  fillSound = soundSnareDD8_3   // DD-8 rim as fill
        case 2:  fillSound = soundSnareGB_3    // GB snare variant as fill
        case 3:  fillSound = soundSnareGB_3
        default: fillSound = soundTom808_1     // 808 tom for a proper fill
        }

        run(SKAction.sequence([
            SKAction.wait(forDuration: beat * 0.5),     // beat 4 "+"
            fillSound,
            SKAction.wait(forDuration: beat * 0.25),    // beat 4 "a"
            fillSound,
            SKAction.wait(forDuration: beat * 0.25),    // beat 1 (doubles the kick)
            fillSound
        ]))
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

                // Kick already fired on spawn — tap just scores and removes the dot
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
