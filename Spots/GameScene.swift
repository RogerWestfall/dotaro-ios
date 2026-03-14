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

// ── Kit colour palettes ────────────────────────────────────────────────────────
// Each kit has a 4-colour palette that matches its sonic character.
// Module-level so DrumPadScene can call these too (same target → same module).

/// Returns the 4-colour palette for the currently active drum kit.
/// GameScene uses it for spawn dot colours; DrumPadScene uses it for pad colours.
func currentKitPalette() -> [SKColor] {
    switch userAudioDefault {
    case 1: // Yamaha DD-8 — 80s neon synthwave
        return [
            SKColor(red: 0.95, green: 0.38, blue: 0.68, alpha: 1), // rose pink
            SKColor(red: 0.0,  green: 0.72, blue: 0.83, alpha: 1), // cyan
            SKColor(red: 0.55, green: 0.82, blue: 0.22, alpha: 1), // lime green
            SKColor(red: 0.58, green: 0.0,  blue: 0.58, alpha: 1), // purple
        ]
    case 2: // Game Boy Drums — retro pixel cool
        return [
            SKColor(red: 0.0,  green: 0.58, blue: 0.40, alpha: 1), // viridian
            SKColor(red: 0.0,  green: 0.28, blue: 0.67, alpha: 1), // cobalt blue
            SKColor(red: 0.15, green: 0.45, blue: 0.75, alpha: 1), // steel blue
            SKColor(red: 0.0,  green: 0.72, blue: 0.83, alpha: 1), // cyan
        ]
    case 3: // Game Boy Tones — melodic, ethereal
        return [
            SKColor(red: 0.58, green: 0.0,  blue: 0.58, alpha: 1), // purple
            SKColor(red: 0.15, green: 0.45, blue: 0.75, alpha: 1), // steel blue
            SKColor(red: 0.95, green: 0.38, blue: 0.68, alpha: 1), // rose pink
            SKColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1), // near black
        ]
    default: // Roland TR-808 — analog warmth
        return [
            SKColor(red: 0.89, green: 0.15, blue: 0.07, alpha: 1), // cadmium red
            SKColor(red: 0.95, green: 0.44, blue: 0.0,  alpha: 1), // cadmium orange
            SKColor(red: 0.70, green: 0.10, blue: 0.20, alpha: 1), // crimson
            SKColor(red: 1.0,  green: 0.80, blue: 0.0,  alpha: 1), // cadmium yellow
        ]
    }
}

/// Returns the primary (first) colour for a given kit index.
/// Used by DrumPadScene to colour each kit's selector dot in its own hue.
func kitPrimaryColor(for kit: Int) -> SKColor {
    switch kit {
    case 1:  return SKColor(red: 0.95, green: 0.38, blue: 0.68, alpha: 1) // rose pink
    case 2:  return SKColor(red: 0.0,  green: 0.28, blue: 0.67, alpha: 1) // cobalt blue
    case 3:  return SKColor(red: 0.58, green: 0.0,  blue: 0.58, alpha: 1) // purple
    default: return SKColor(red: 0.89, green: 0.15, blue: 0.07, alpha: 1) // cadmium red
    }
}

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
    // 4 beats = one full musical bar — gives the player time to place
    // their tap musically rather than scrambling. Shrinks naturally as
    // BPM rises, so the window tightens gradually without feeling punishing.
    var dotLifetime: Double { beat * 4.0 }

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

        backgroundColor = SKColor(white: 0.97, alpha: 1.0)

        scoreLabel.fontSize = 15
        scoreLabel.text = "Score 0"
        scoreLabel.fontColor = SKColor(white: 0.12, alpha: 1.0)
        scoreLabel.horizontalAlignmentMode = .center
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.95)
        addChild(scoreLabel)

        let defaults = UserDefaults.standard
        let highScoreNumber = defaults.integer(forKey: "highScoreSaved")

        let highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScoreLabel.text = "High \(highScoreNumber)"
        highScoreLabel.fontSize = 15
        highScoreLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        highScoreLabel.horizontalAlignmentMode = .left
        highScoreLabel.position = CGPoint(x: self.size.width * 0.05, y: self.size.height * 0.95)
        highScoreLabel.zPosition = 1
        addChild(highScoreLabel)

        totalLabel.text = "Total 0"
        totalLabel.fontSize = 15
        totalLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        totalLabel.horizontalAlignmentMode = .right
        totalLabel.position = CGPoint(x: self.size.width * 0.95, y: self.size.height * 0.95)
        totalLabel.zPosition = 1
        addChild(totalLabel)

        // Intro kick establishes the tempo; hi-hat + first dot launch one beat later.
        playKickSound()
        run(SKAction.sequence([
            SKAction.wait(forDuration: beat),
            SKAction.run {
                self.startRhythm()
                self.spawnDot()
            }
        ]))
    }

    // Starts (or re-syncs) the hi-hat loop at the current BPM.
    //
    // Dots are player-driven: tapping the single active dot immediately
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

    // One dot at a time — picks a random colour from the active kit's palette,
    // pops in with a brief scale pulse, then shrinks to zero over dotLifetime.
    // Tapping it fires either a kick or snare sound (alternating by tapCount)
    // and immediately spawns the next dot so the player keeps their groove.
    // Missing (dot reaches zero) → game over.
    func spawnDot() {
        let palette = currentKitPalette()
        let dot = SKShapeNode(circleOfRadius: 46)
        dot.fillColor   = palette[Int.random(in: 0..<palette.count)]
        dot.strokeColor = .clear
        dot.zPosition   = 2
        dot.name        = "dotObject"
        dot.position    = randomPosition(for: dot)
        addChild(dot)

        dot.run(SKAction.sequence([
            SKAction.scale(to: 1.18, duration: 0.10), // attention pop
            SKAction.scale(to: 1.0,  duration: 0.06), // settle
            SKAction.scale(to: 0,    duration: dotLifetime), // countdown
            SKAction.run(runnGameOver)
        ]))
    }

    // Works for both SKSpriteNode and SKShapeNode — uses frame.size for margins
    // so the dot is always fully on-screen regardless of node type.
    func randomPosition(for node: SKNode) -> CGPoint {
        let w = node.frame.size.width
        let h = node.frame.size.height
        let x = CGFloat.random(in: (gameArea.minX + w)...(gameArea.maxX - w))
        let y = CGFloat.random(in: (gameArea.minY + h)...(gameArea.maxY - h))
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
    //
    // Tempo bumps every 48 taps (+5% BPM) — gives the player time to settle
    // into a groove at each level before the pressure increases.
    // Tom fills fire midway (every 24 taps) as a musical phrase marker.
    func checkTempoAndFills() {
        if tapCount % 48 == 0 {
            increaseTempo()
        }
        if tapCount % 24 == 0 && tapCount % 48 != 0 {
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
        let sceneTransition = SKTransition.fade(withDuration: 0.3)
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

                gameScore += 1
                tapCount += 1
                scoreLabel.text = "Score \(gameScore)"
                totalLabel.text  = "Total \(gameScore)"

                // Odd taps → kick; even taps → snare.
                // The player drives both instruments with a single dot,
                // creating a natural kick-snare pattern through their rhythm.
                if tapCount % 2 == 1 {
                    scoreNumber += 1
                    playKickSound()
                } else {
                    scoreNumber2 += 1
                    playClapSound()
                }

                spawnDot()
                checkTempoAndFills()
            }
        }
    }
}
