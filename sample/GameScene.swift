//
//  GameScene.swift
//  sample
//
//  Created by ウエキチ on 2018/09/15.
//  Copyright © 2018年 ウエキチ. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    // モグラの位置
    let mogPoint = [[200,300],[600,400],[300,600],[650,700],[250,900]]
    var mogArray:[SKSpriteNode] = []
    
    var score = 0
    let scoreLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    var timeCount = 20
    let timeLabel  = SKLabelNode(fontNamed: "Verdana-bold")
    var myTimer = Timer()
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.9, green: 0.84, blue: 0.71, alpha: 1)
        // スコアを表示する
        scoreLabel.text = "SCORE:\(score)"
        scoreLabel.fontSize = 50
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.fontColor = SKColor.black
        scoreLabel.position = CGPoint(x:40, y:1250)
        self.addChild(scoreLabel)
        
        for i in 0...4 {
            let hole = SKSpriteNode(imageNamed: "mog1.png")
            hole.position = CGPoint(x:mogPoint[i][0], y:mogPoint[i][1])
            self.addChild(hole)
            
            let mog = SKSpriteNode(imageNamed: "mog2.png")
            mog.position = CGPoint(x:mogPoint[i][0], y:mogPoint[i][1])
            self.addChild(mog)
            
            mogArray.append(mog)
            
            let action1 = SKAction.moveTo(y: -1000, duration: 0.0)
            let action2 = SKAction.wait(forDuration: 2.0, withRange: 4.0)
            let action3 = SKAction.moveTo(y: hole.position.y, duration: 0.0)
            let action4 = SKAction.wait(forDuration: 1.0, withRange: 2.0)
            let actionS = SKAction.sequence([action1,action2,action3,action4])
            let actionR = SKAction.repeatForever(actionS)
            mog.run(actionR)
        }
        // 残り時間を表示する
        timeLabel.text = "Time:\(timeCount)"
        timeLabel.horizontalAlignmentMode = .left
        timeLabel.fontSize = 50
        timeLabel.fontColor = SKColor.black
        timeLabel.position = CGPoint(x:480, y:1250)
        self.addChild(timeLabel)
        // タイマーをスタートする（1.0秒ごとにtimerUpdateを繰り返し実行）
        myTimer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(self.timerUpdate),
            userInfo: nil,
            repeats: true)
    }
    // タイマーで実行される処理（1.0秒ごとに繰り返し実行）
    @objc func timerUpdate() {
        timeCount -= 1                            // 残り秒数を 1 減らす
        timeLabel.text = "Time:\(timeCount)"    // 残り秒数を表示
        if timeCount < 1 {
            myTimer.invalidate()
            let scene = GameOverScene(size: self.size)
            let skView = self.view as! GameSKView
            skView.score = score
            scene.scaleMode = SKSceneScaleMode.aspectFill
            skView.presentScene(scene)
            
        }
    }

    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in : self)
            // タッチした位置にあるものを調べる
            let touchNode = self.atPoint(location)
            for i in 0...4 {    // 0〜4まで繰り返す
                // もし、タッチしたものがモグラだったら、やっつける
                if touchNode == mogArray[i] {
                    score += 10
                    scoreLabel.text = "SCORE:\(score)"
                    
                    let mog = SKSpriteNode(imageNamed: "mog3.png")  // やられたモグラを作る
                    mog.position = touchNode.position               // 位置を指定する
                    self.addChild(mog)                              // やられたモグラを表示させる
                    
                    // 【モグラに回転しながら上に飛び出して消えるアクションをつける】
                    // モグラを１回転するアクション
                    let action1 = SKAction.rotate(byAngle: 6.28, duration: 0.3)
                    // モグラを上に100移動するアクション
                    let action2 = SKAction.moveTo(y: touchNode.position.y + 150, duration: 0.3)
                    // action1とaction2を同時に行う
                    let actionG = SKAction.group([action1, action2])
                    // モグラを削除するアクション
                    let action3 = SKAction.removeFromParent()
                    // actionGとaction3を順番に行う
                    let actionS = SKAction.sequence([actionG, action3])
                    // モグラに「回転しながら上に飛び出して消えるアクション」をつける
                    mog.run(actionS)
                    
                    touchNode.position.y = -1000            // モグラを地下（-1000）に移動して消す
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
