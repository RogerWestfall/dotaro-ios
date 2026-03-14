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

    // ── Kit selector dots — each shows its own kit's primary colour ────────────
    // Stored as class properties so updateKitSelection() can set alpha in-place.
    let kitDot808 = SKShapeNode(circleOfRadius: 20)
    let kitDotDD8 = SKShapeNode(circleOfRadius: 20)
    let kitDotGB  = SKShapeNode(circleOfRadius: 20)
    let kitDotGBT = SKShapeNode(circleOfRadius: 20)

    // ── 3×3 drum pad buttons — colours updated whenever kit changes ────────────
    var drumPadNodes: [SKShapeNode] = []

    override func didMove(to view: SKView) {

        backgroundColor = SKColor(white: 0.97, alpha: 1.0)

        // ── Header ─────────────────────────────────────────────────────────────
        let headerLabel = SKLabelNode(fontNamed: "Pusab")
        headerLabel.text = "Settings and Bonus Drum Pad"
        headerLabel.fontSize = 15
        headerLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        headerLabel.horizontalAlignmentMode = .center
        headerLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.95)
        headerLabel.zPosition = 1
        self.addChild(headerLabel)

        // ── Main menu button (bottom-right) ────────────────────────────────────
        mainMenuButton.setScale(0.08)
        mainMenuButton.zPosition = 2
        mainMenuButton.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.05)
        mainMenuButton.name = "MainMenuButton"
        self.addChild(mainMenuButton)

        // ── Historical total ───────────────────────────────────────────────────
        let historicalLabel = SKLabelNode(fontNamed: "Pusab")
        historicalLabel.text = "Total Score \(historicalScoreNumber)"
        historicalLabel.fontSize = 15
        historicalLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        historicalLabel.horizontalAlignmentMode = .center
        historicalLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.90)
        historicalLabel.zPosition = 1
        self.addChild(historicalLabel)

        // ── Kit selector labels ────────────────────────────────────────────────
        let kitLabels: [(String, CGFloat)] = [
            ("Roland TR-808",       0.81),
            ("Yamaha DD-8",         0.74),
            ("Game Boy 8-Bit Drums",0.67),
            ("Game Boy 8-Bit Tones",0.60),
        ]
        for (text, yFrac) in kitLabels {
            let label = SKLabelNode(fontNamed: "Pusab")
            label.text = text
            label.fontSize = 15
            label.fontColor = SKColor(white: 0.12, alpha: 1.0)
            label.horizontalAlignmentMode = .left
            label.position = CGPoint(x: self.size.width * 0.3, y: self.size.height * yFrac)
            label.zPosition = 1
            self.addChild(label)
        }

        // ── Kit selector dots — each coloured in its own kit's primary hue ─────
        // Active kit = full opacity; inactive = 30% (set in updateKitSelection).
        let kitSelectorDots: [(SKShapeNode, Int, CGFloat)] = [
            (kitDot808, 0, 0.82),
            (kitDotDD8, 1, 0.75),
            (kitDotGB,  2, 0.68),
            (kitDotGBT, 3, 0.61),
        ]
        for (dot, kit, yFrac) in kitSelectorDots {
            dot.fillColor   = kitPrimaryColor(for: kit)
            dot.strokeColor = .clear
            dot.zPosition   = 2
            dot.position    = CGPoint(x: self.size.width * 0.2, y: self.size.height * yFrac)
            dot.name = ["Dot808", "DotDD8", "DotGB", "DotGBT"][kit]
            self.addChild(dot)
        }

        // ── 3×3 drum pad grid ──────────────────────────────────────────────────
        // Positions: columns at 0.2 / 0.5 / 0.8, rows at 0.45 / 0.30 / 0.15
        let padPositions: [(CGFloat, CGFloat)] = [
            (0.2, 0.45), (0.5, 0.45), (0.8, 0.45),
            (0.2, 0.30), (0.5, 0.30), (0.8, 0.30),
            (0.2, 0.15), (0.5, 0.15), (0.8, 0.15),
        ]
        drumPadNodes.removeAll()
        for (i, (xFrac, yFrac)) in padPositions.enumerated() {
            let pad = SKShapeNode(circleOfRadius: 42)
            pad.strokeColor = .clear
            pad.zPosition   = 2
            pad.name        = "Dot\(i + 1)"
            pad.position    = CGPoint(x: self.size.width * xFrac, y: self.size.height * yFrac)
            self.addChild(pad)
            drumPadNodes.append(pad)
        }

        // Apply initial kit colours and selection highlight
        updateKitSelection()

        run(soundKick808_3)
    }

    // ── Visual update: kit selector alpha + drum pad colours ──────────────────
    // Active kit selector = full opacity; others = 30%.
    // All 9 pad buttons recolour to the active kit's palette instantly.
    private func updateKitSelection() {
        kitDot808.alpha = userAudioDefault == 0 ? 1.0 : 0.3
        kitDotDD8.alpha = userAudioDefault == 1 ? 1.0 : 0.3
        kitDotGB.alpha  = userAudioDefault == 2 ? 1.0 : 0.3
        kitDotGBT.alpha = userAudioDefault == 3 ? 1.0 : 0.3
        updateDrumPadColors()
    }

    // Cycles the 9 pad buttons through the 4-colour kit palette.
    private func updateDrumPadColors() {
        let palette = currentKitPalette()
        for (i, pad) in drumPadNodes.enumerated() {
            pad.fillColor = palette[i % palette.count]
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches {

            let positionOfTouch  = touch.location(in: self)
            let tappedNode       = atPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name

            // ── Drum pad sounds (kit-aware) ─────────────────────────────────────
            if userAudioDefault == 0 {

                if nameOfTappedNode == "Dot1" { run(soundKick808_1) }
                if nameOfTappedNode == "Dot2" { run(soundSnare808_1) }
                if nameOfTappedNode == "Dot3" { run(soundHiHat808_1) }
                if nameOfTappedNode == "Dot4" { run(soundKick808_3) }
                if nameOfTappedNode == "Dot5" { run(soundSnare808_2) }
                if nameOfTappedNode == "Dot6" { run(soundHiHat808_2) }
                if nameOfTappedNode == "Dot7" { run(soundStab1) }
                if nameOfTappedNode == "Dot8" { run(soundSnare808_4) }
                if nameOfTappedNode == "Dot9" { run(soundCowbell808_1) }

            } else if userAudioDefault == 1 {

                if nameOfTappedNode == "Dot1" { run(soundKickDD8_1) }
                if nameOfTappedNode == "Dot2" { run(soundSnareDD8_1) }
                if nameOfTappedNode == "Dot3" { run(soundHiHatDD8_1) }
                if nameOfTappedNode == "Dot4" { run(soundKickDD8_3) }
                if nameOfTappedNode == "Dot5" { run(soundSnareDD8_2) }
                if nameOfTappedNode == "Dot6" { run(soundHiHatDD8_2) }
                if nameOfTappedNode == "Dot7" { run(soundStabDD8_1) }
                if nameOfTappedNode == "Dot8" { run(soundStabDD8_3) }
                if nameOfTappedNode == "Dot9" { run(soundStabDD8_2) }

            } else if userAudioDefault == 2 {

                if nameOfTappedNode == "Dot1" { run(soundKickGB_1) }
                if nameOfTappedNode == "Dot2" { run(soundSnareGB_1) }
                if nameOfTappedNode == "Dot3" { run(soundKickGBT_9) }
                if nameOfTappedNode == "Dot4" { run(soundKickGB_3) }
                if nameOfTappedNode == "Dot5" { run(soundSnareGB_2) }
                if nameOfTappedNode == "Dot6" { run(soundKickGBT_1) }
                if nameOfTappedNode == "Dot7" { run(soundStabGB_1) }
                if nameOfTappedNode == "Dot8" { run(soundStabGB_3) }
                if nameOfTappedNode == "Dot9" { run(soundStabGB_2) }

            } else if userAudioDefault == 3 {

                if nameOfTappedNode == "Dot1" { run(soundKickGBT_1) }
                if nameOfTappedNode == "Dot2" { run(soundKickGBT_2) }
                if nameOfTappedNode == "Dot3" { run(soundKickGBT_3) }
                if nameOfTappedNode == "Dot4" { run(soundKickGBT_4) }
                if nameOfTappedNode == "Dot5" { run(soundKickGBT_5) }
                if nameOfTappedNode == "Dot6" { run(soundKickGBT_6) }
                if nameOfTappedNode == "Dot7" { run(soundKickGBT_7) }
                if nameOfTappedNode == "Dot8" { run(soundKickGBT_8) }
                if nameOfTappedNode == "Dot9" { run(soundKickGBT_9) }
            }

            // ── Navigation ────────────────────────────────────────────────────
            if nameOfTappedNode == "MainMenuButton" {
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.3)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }

            // ── Kit selection — persist, refresh selector + all pads ──────────
            if nameOfTappedNode == "Dot808" {
                userAudioDefault = 0
                defaults.set(userAudioDefault, forKey: "userAudioDefault")
                updateKitSelection()
            }

            if nameOfTappedNode == "DotDD8" {
                userAudioDefault = 1
                defaults.set(userAudioDefault, forKey: "userAudioDefault")
                updateKitSelection()
            }

            if nameOfTappedNode == "DotGB" {
                userAudioDefault = 2
                defaults.set(userAudioDefault, forKey: "userAudioDefault")
                updateKitSelection()
            }

            if nameOfTappedNode == "DotGBT" {
                userAudioDefault = 3
                defaults.set(userAudioDefault, forKey: "userAudioDefault")
                updateKitSelection()
            }
        }
    }
}
