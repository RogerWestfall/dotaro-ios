//
//  GameOverScene.swift
//  Dotaro
//
//  Created by Roger Westfall on 12/23/16.
//  Copyright © 2016 Roger Westfall. All rights reserved.
//

import Foundation
import SpriteKit

let defaults = UserDefaults()

var historicalScoreNumber = defaults.integer(forKey: "historicalNumberSaved")


class GameOverScene: SKScene {

    let restartLabel  = SKLabelNode(fontNamed: "Pusab")
    let restartLabel2 = SKLabelNode(fontNamed: "Pusab")
    let restartButton = SKSpriteNode(imageNamed: "dot2")
    let settingsButton = SKSpriteNode(imageNamed: "dot6")

    override func didMove(to view: SKView) {

        backgroundColor = SKColor(white: 0.97, alpha: 1.0)

        // Damien Hirst spot painting — tiled coloured circles behind everything
        addSpotBackground()

        // ── Settings button (bottom-right) ─────────────────────────────────────
        settingsButton.setScale(0.08)
        settingsButton.zPosition = 2
        settingsButton.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.05)
        settingsButton.name = "SettingsButton"
        self.addChild(settingsButton)

        // ── Score update & persistence ─────────────────────────────────────────
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")

        if gameScore > highScoreNumber {
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
        }

        historicalScoreNumber += gameScore
        defaults.set(historicalScoreNumber, forKey: "historicalNumberSaved")

        // ── "GAME OVER" heading ────────────────────────────────────────────────
        let gameOverLabel = SKLabelNode(fontNamed: "Pusab")
        gameOverLabel.text = "GAME OVER"
        gameOverLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        gameOverLabel.fontSize = 36
        gameOverLabel.horizontalAlignmentMode = .center
        gameOverLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.80)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)

        // ── Score as large centrepiece ─────────────────────────────────────────
        let bigScoreLabel = SKLabelNode(fontNamed: "Pusab")
        bigScoreLabel.text = "\(gameScore)"
        bigScoreLabel.fontColor = SKColor(white: 0.12, alpha: 1.0)
        bigScoreLabel.fontSize = 72
        bigScoreLabel.horizontalAlignmentMode = .center
        bigScoreLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.60)
        bigScoreLabel.zPosition = 1
        self.addChild(bigScoreLabel)

        let scoreWordLabel = SKLabelNode(fontNamed: "Pusab")
        scoreWordLabel.text = "SCORE"
        scoreWordLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        scoreWordLabel.fontSize = 13
        scoreWordLabel.horizontalAlignmentMode = .center
        scoreWordLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.55)
        scoreWordLabel.zPosition = 1
        self.addChild(scoreWordLabel)

        // ── High score & cumulative total ──────────────────────────────────────
        let highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScoreLabel.text = "HIGH  \(highScoreNumber)"
        highScoreLabel.fontSize = 15
        highScoreLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        highScoreLabel.horizontalAlignmentMode = .right
        highScoreLabel.position = CGPoint(x: self.size.width * 0.46, y: self.size.height * 0.43)
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)

        let historicalLabel = SKLabelNode(fontNamed: "Pusab")
        historicalLabel.text = "TOTAL  \(historicalScoreNumber)"
        historicalLabel.fontSize = 15
        historicalLabel.fontColor = SKColor(white: 0.50, alpha: 1.0)
        historicalLabel.horizontalAlignmentMode = .left
        historicalLabel.position = CGPoint(x: self.size.width * 0.54, y: self.size.height * 0.43)
        historicalLabel.zPosition = 1
        self.addChild(historicalLabel)

        // ── Play Again button ──────────────────────────────────────────────────
        restartLabel.text = "Play"
        restartLabel.fontSize = 20
        restartLabel.fontColor = SKColor(white: 0.97, alpha: 1.0)
        restartLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.215)
        restartLabel.zPosition = 3
        self.addChild(restartLabel)

        restartLabel2.text = "Again"
        restartLabel2.fontSize = 20
        restartLabel2.fontColor = SKColor(white: 0.97, alpha: 1.0)
        restartLabel2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.185)
        restartLabel2.zPosition = 3
        self.addChild(restartLabel2)

        restartButton.setScale(0.25)
        restartButton.zPosition = 2
        restartButton.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.20)
        self.addChild(restartButton)
    }

    // ── Damien Hirst spot painting ─────────────────────────────────────────────
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

            if restartButton.contains(pointOfTouch) {
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
