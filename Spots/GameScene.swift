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

var gameScore = 0

// Starting BPM — increases by 5% every 48 taps (see checkTempoAndFills)
let startingBPM: Double = 86.0

// ── Kit colour palettes ────────────────────────────────────────────────────────
// Each kit has a 4-colour palette that matches its sonic character.
// Module-level so DrumPadScene can call these too (same target → same module).

/// Returns the 4-colour palette for the currently active drum kit.
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

    let scoreLabel = SKLabelNode(fontNamed: "Pusab")
    let totalLabel = SKLabelNode(fontNamed: "Pusab")
    var gameArea = CGRect()

    // Live BPM — starts at 86, increases 5% every 48 taps.
    var currentBPM: Double = startingBPM

    // One beat in seconds at the current tempo.
    var beat: Double { 60.0 / currentBPM }

    // One 64th note — the quantization resolution for dot spawning.
    // At 86 BPM a 64th note is ~44 ms — effectively imperceptible as a delay,
    // so spawns feel immediate while still locking to the beat grid.
    var sixtyFourthNote: Double { beat / 16 }

    // How long a dot stays on screen before triggering game over (one full bar).
    // Shortens naturally as BPM rises, so difficulty increases gradually.
    var dotLifetime: Double { beat * 4.0 }

    // Total taps this game — drives tempo progression and fills.
    var tapCount = 0

    // Sequential position in the 8-step bar pattern (0–7).
    // Advances by exactly 1 per spawn so every dot always produces a sound.
    // The 64th-note quantization still controls WHEN the dot appears;
    // this controls WHAT it sounds like.
    var gridStep: Int = 0

    // How many complete bars have elapsed. Used to trigger the horn accent
    // every 16 bars — a musical landmark without cluttering the groove.
    var barCount: Int = 0

    // Wall-clock time at which the last dot was spawned.
    // Used to compute how many 64th-note steps have elapsed since then.
    var lastSpawnTime: TimeInterval = 0

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
        gameScore = 0
        tapCount = 0
        gridStep = 0
        barCount = 0
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

        // First dot spawns immediately on beat 1 (gridStep 0 → kick).
        spawnDot()
    }

    // Called after every tap. Calculates the next 64th-note boundary from now
    // and schedules the next dot spawn at exactly that moment.
    //
    // Because every spawn is quantized to the global beat grid, the sounds
    // always land on a musical subdivision — the player's tapping rhythm
    // directly generates the kick/snare/hat pattern they hear.
    func scheduleNextDot() {
        let now = CACurrentMediaTime()
        let elapsed = now - lastSpawnTime

        // Floor + 1 ensures we always target a future boundary, never the past.
        // Timing: snap to next 64th-note boundary
        let stepsToNext = Int(elapsed / sixtyFourthNote) + 1
        let delay = Double(stepsToNext) * sixtyFourthNote - elapsed

        // Sound: always advance exactly 1 step through the 8-step pattern
        let nextStep = (gridStep + 1) % 8

        run(SKAction.sequence([
            SKAction.wait(forDuration: max(0.001, delay)),
            SKAction.run {
                if nextStep == 0 { self.barCount += 1 }
                self.gridStep = nextStep
                self.spawnDot()
            }
        ]), withKey: "nextDot")
    }

    // Creates one dot at a random position and fires the sound assigned to the
    // current gridStep. The dot shrinks to zero over dotLifetime; missing it
    // triggers game over.
    func spawnDot() {
        lastSpawnTime = CACurrentMediaTime()
        playGridSound(forStep: gridStep)

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

    func randomPosition(for node: SKNode) -> CGPoint {
        let w = node.frame.size.width
        let h = node.frame.size.height
        let x = CGFloat.random(in: (gameArea.minX + w)...(gameArea.maxX - w))
        let y = CGFloat.random(in: (gameArea.minY + h)...(gameArea.maxY - h))
        return CGPoint(x: x, y: y)
    }

    // Maps the 8-step sequential pattern to drum sounds.
    // Every step has a sound — no silent positions. Kick-heavy with
    // snare on steps 2 and 6 (beats 2 and 4), one open hat per bar.
    //
    //  Step 0 → kick    (beat 1)
    //  Step 1 → kick    (syncopated)
    //  Step 2 → snare   (beat 2)
    //  Step 3 → kick    (beat 3)
    //  Step 4 → kick    (syncopated)
    //  Step 5 → kick    (beat 3 offbeat)
    //  Step 6 → snare   (beat 4)
    //  Step 7 → open hat (bar turnaround)
    //  Step 0 of every 16th bar → horn accent instead of kick
    func playGridSound(forStep step: Int) {
        if step == 0 && barCount > 0 && barCount % 16 == 0 {
            playHorn()
            return
        }

        switch step {
        case 2, 6: playClapSound()
        case 7:    playOpenHat()
        default:   playKickSound()
        }
    }

    // Horn / stab accent — fires at the top of every 16th bar.
    func playHorn() {
        switch userAudioDefault {
        case 1:  run(soundStabDD8_2)
        case 2:  run(soundStabGB_1)
        case 3:  run(soundStabGB_3)
        default: run(soundStab1)
        }
    }

    // Bumps BPM by 5% — dotLifetime and sixtyFourthNote shorten automatically.
    func increaseTempo() {
        currentBPM *= 1.05
    }

    // Closed hi-hat (or kit equivalent) — sparse fill positions
    func playClosedHat() {
        switch userAudioDefault {
        case 1:  run(soundHiHatDD8_1)
        case 2:  run(soundKickGB_4)     // GB has no hat — use soft kick variant
        case 3:  run(SKAction.playSoundFileNamed("GBpulse\(Int.random(in: 6...10)).wav", waitForCompletion: false))
        default: run(soundHiHat808_1)
        }
    }

    // Open hi-hat (or kit equivalent) — groove pocket
    func playOpenHat() {
        switch userAudioDefault {
        case 1:  run(soundHiHatDD8_2)
        case 2:  run(soundSnareGB_4)    // GB: rim-like snare as open hat substitute
        case 3:  run(SKAction.playSoundFileNamed("GBpulse\(Int.random(in: 1...5)).wav", waitForCompletion: false))
        default: run(soundHiHat808_2)
        }
    }

    // Kick — fires on beats 1 and 3 (steps 0 and 32).
    // Cycles through kick variants every 8 taps for tonal variation.
    func playKickSound() {
        switch userAudioDefault {
        case 1:
            let kicks = [soundKickDD8_1, soundKickDD8_3, soundKickDD8_1, soundKickDD8_1, soundKickDD8_3]
            run(kicks[(tapCount / 8) % kicks.count])
        case 2:
            let kicks = [soundKickGB_1, soundKickGB_3, soundKickGB_4, soundKickGB_1, soundKickGB_3]
            run(kicks[(tapCount / 8) % kicks.count])
        case 3:
            run(SKAction.playSoundFileNamed("GBpulse\(Int.random(in: 1...10)).wav", waitForCompletion: false))
        default:
            let kicks = [soundKick808_1, soundKick808_3, soundKick808_1, soundKick808_1, soundKick808_3]
            run(kicks[(tapCount / 8) % kicks.count])
        }
    }

    // Snare — fires only when a dot spawns on a snare grid step (16, 48).
    // Cycles through all snare variants within the active kit.
    func playClapSound() {
        let idx = (tapCount / 2) % 4
        switch userAudioDefault {
        case 1:
            let snares = [soundSnareDD8_1, soundSnareDD8_2, soundSnareDD8_3, soundSnareDD8_4]
            run(snares[idx])
        case 2:
            let snares = [soundSnareGB_1, soundSnareGB_2, soundSnareGB_3, soundSnareGB_4]
            run(snares[idx])
        case 3:
            let snares = [soundSnareGBT_1, soundSnareGBT_2, soundSnareGBT_3, soundSnareGBT_4]
            run(snares[idx])
        default:
            let snares = [soundSnare808_1, soundSnare808_2, soundSnare808_3, soundSnare808_4]
            run(snares[idx])
        }
    }

    // Tempo increase every 48 taps; tom fill midway at 24 taps.
    func checkTempoAndFills() {
        if tapCount % 48 == 0 {
            increaseTempo()
        }
        if tapCount % 24 == 0 && tapCount % 48 != 0 {
            playTomFill()
        }
    }

    // Tom fill — 3 rapid kick hits marking each mini-phrase boundary.
    // Uses kicks (not snares) so the fill never fires a snare without a dot.
    func playTomFill() {
        let fillSound: SKAction
        switch userAudioDefault {
        case 1:  fillSound = soundKickDD8_2
        case 2:  fillSound = soundKickGB_3
        case 3:  fillSound = SKAction.playSoundFileNamed("GBpulse\(Int.random(in: 1...5)).wav", waitForCompletion: false)
        default: fillSound = soundTom808_1
        }

        run(SKAction.sequence([
            fillSound,
            SKAction.wait(forDuration: beat * 0.125),
            fillSound,
            SKAction.wait(forDuration: beat * 0.125),
            fillSound
        ]))
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

                // Tap removes the dot silently — next dot spawns at the nearest
                // future 64th-note boundary and fires its grid-assigned sound.
                scheduleNextDot()
                checkTempoAndFills()
            }
        }
    }
}
