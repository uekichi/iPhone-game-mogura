//
//  GameOverScene.swift
//  sample
//
//  Created by ウエキチ on 2018/09/18.
//  Copyright © 2018年 ウエキチ. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    // ゲームオーバー用ラベルと、リプレイボタン用ラベルを用意する
    let endLabel = SKLabelNode(fontNamed: "Verdana-bold")
    let replayLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    override func didMove(to view: SKView) {
        // 背景色をつける
        self.backgroundColor = UIColor.brown
        // ゲームオーバーを表示する
        endLabel.text = "GAMEOVER"
        endLabel.fontSize = 100
        endLabel.fontColor = UIColor.yellow
        endLabel.position = CGPoint(x:375, y:900)
        self.addChild(endLabel)
        // リプレイボタンを表示する
        replayLabel.text = "REPLAY"
        replayLabel.fontSize = 60
        replayLabel.position = CGPoint(x:375, y:300)
        self.addChild(replayLabel)
        // スコアを表示する
        let scoreLabel = SKLabelNode(fontNamed: "Verdana-bold")
        let gameSKView = self.view as! GameSKView
        scoreLabel.text = "SCORE:\(gameSKView.score)"
        scoreLabel.fontSize = 40
        scoreLabel.position = CGPoint(x:375, y:700)
        self.addChild(scoreLabel)
    }
    // タッチしたときの処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)   // タッチした位置を調べて
            let touchNode = self.atPoint(location)  // その位置にあるものを調べる
            // もし、タッチした位置にあるものがリプレイボタンなら
            if touchNode == replayLabel {
                // TitleSceneに切り換える
                let scene = TitleScene(size: self.size)
                let skView = self.view as SKView?
                scene.scaleMode = SKSceneScaleMode.aspectFill
                skView?.presentScene(scene)
            }
        }
    }
}
