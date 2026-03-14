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

    let startButton    = SKSpriteNode(imageNamed: "dot3")
    let settingsButton = SKSpriteNode(imageNamed: "dot6")

    override func didMove(to view: SKView) {

        backgroundColor = SKColor(white: 0.97, alpha: 1.0)

        // Damien Hirst spot painting — tiled coloured circles behind everything
        addSpotBackground()

        // ── DOTARO title ─────────────────────────────────────────────────────
        let titleLabel = SKLabelNode(fontNamed: "Pusab")
        titleLabel.text = "DOTARO"
        titleLabel.fontSize = 52
        titleLabel.fontColor = SKColor(white: 0.12, alpha: 1.0)
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.70)
        titleLabel.zPosition = 1
        self.addChild(titleLabel)

        // ── Taglines (fade in slowly) ─────────────────────────────────────────
        let gameName1 = SKLabelNode(fontNamed: "The Bold Font")
        gameName1.text = "Better with Headphones"
        gameName1.fontSize = 20
        gameName1.fontColor = SKColor(white: 0.50, alpha: 1.0)
        gameName1.alpha = 0
        gameName1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.30)
        gameName1.zPosition = 1
        self.addChild(gameName1)

        let gameName2 = SKLabelNode(fontNamed: "The Bold Font")
        gameName2.text = "Feel the Bass"
        gameName2.fontSize = 30
        gameName2.fontColor = SKColor(white: 0.50, alpha: 1.0)
        gameName2.alpha = 0
        gameName2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.25)
        gameName2.zPosition = 1
        self.addChild(gameName2)

        // ── Play button ───────────────────────────────────────────────────────
        let startLabel = SKLabelNode(fontNamed: "Pusab")
        startLabel.text = "Play"
        startLabel.fontSize = 20
        startLabel.fontColor = SKColor(white: 0.97, alpha: 1.0)
        startLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.485)
        startLabel.zPosition = 3
        self.addChild(startLabel)

        startButton.setScale(0.25)
        startButton.zPosition = 2
        startButton.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.5)
        startButton.name = "StartButton"
        self.addChild(startButton)

        // ── Settings button (bottom-right) ────────────────────────────────────
        settingsButton.setScale(0.08)
        settingsButton.zPosition = 2
        settingsButton.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.05)
        settingsButton.name = "SettingsButton"
        self.addChild(settingsButton)

        // ── Version label (bottom-left) ───────────────────────────────────────
        let info         = Bundle.main.infoDictionary
        let shortVersion = info?["CFBundleShortVersionString"] as? String ?? "0"
        let buildNumber  = info?["CFBundleVersion"]            as? String ?? "0"
        let versionLabel = SKLabelNode(fontNamed: "Pusab")
        versionLabel.text = "v\(shortVersion) (\(buildNumber))"
        versionLabel.fontSize = 10
        versionLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        versionLabel.horizontalAlignmentMode = .left
        versionLabel.position = CGPoint(x: self.size.width * 0.05, y: self.size.height * 0.02)
        versionLabel.zPosition = 1
        self.addChild(versionLabel)

        // Fade taglines in over 5 seconds
        let fadeInAction = SKAction.fadeIn(withDuration: 5.0)
        gameName1.run(fadeInAction)
        gameName2.run(fadeInAction)

        run(soundKick808_3)
    }

    // ── Damien Hirst spot painting ─────────────────────────────────────────────
    // Tiles small solid-colour circles across the canvas at 18 % opacity.
    // Colours mirror the Hirst pharmaceutical palette: cadmium primaries,
    // viridian, cobalt, rose, and near-black.
    private func addSpotBackground() {
        let colors: [SKColor] = [
            SKColor(red: 0.89, green: 0.15, blue: 0.07, alpha: 1), // cadmium red
            SKColor(red: 0.0,  green: 0.28, blue: 0.67, alpha: 1), // cobalt blue
            SKColor(red: 1.0,  green: 0.80, blue: 0.0,  alpha: 1), // cadmium yellow
            SKColor(red: 0.0,  green: 0.58, blue: 0.40, alpha: 1), // viridian green
            SKColor(red: 0.95, green: 0.44, blue: 0.0,  alpha: 1), // cadmium orange
            SKColor(red: 0.58, green: 0.0,  blue: 0.58, alpha: 1), // purple
            SKColor(red: 0.95, green: 0.38, blue: 0.68, alpha: 1), // rose pink
            SKColor(red: 0.0,  green: 0.72, blue: 0.83, alpha: 1), // cyan
            SKColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1), // near black
            SKColor(red: 0.55, green: 0.82, blue: 0.22, alpha: 1), // lime green
            SKColor(red: 0.70, green: 0.10, blue: 0.20, alpha: 1), // crimson
            SKColor(red: 0.15, green: 0.45, blue: 0.75, alpha: 1), // steel blue
        ]
        let radius:  CGFloat = 17
        let spacing: CGFloat = radius * 3.4
        let cols = Int(size.width  / spacing) + 2
        let rows = Int(size.height / spacing) + 2

        for row in 0..<rows {
            for col in 0..<cols {
                let dot = SKShapeNode(circleOfRadius: radius)
                dot.fillColor   = colors[(col * 5 + row * 7) % colors.count]
                dot.strokeColor = .clear
                dot.alpha       = 0.18
                dot.position    = CGPoint(
                    x: CGFloat(col) * spacing + spacing * 0.5,
                    y: CGFloat(row) * spacing + spacing * 0.5
                )
                dot.zPosition = 0
                addChild(dot)
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {

            let pointOfTouch = touch.location(in: self)

            if startButton.contains(pointOfTouch) {
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.3)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }

            if settingsButton.contains(pointOfTouch) {
                let sceneToMoveTo2 = DrumPadScene(size: self.size)
                run(soundSnare808_2)
                sceneToMoveTo2.scaleMode = self.scaleMode
                let myTransition2 = SKTransition.fade(withDuration: 0.3)
                self.view!.presentScene(sceneToMoveTo2, transition: myTransition2)
            }
        }
    }
}
