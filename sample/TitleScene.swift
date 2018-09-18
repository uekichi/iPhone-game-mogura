//
//  TitleScene.swift
//  sample
//
//  Created by ウエキチ on 2018/09/18.
//  Copyright © 2018年 ウエキチ. All rights reserved.
//

import SpriteKit

class TitleScene: SKScene {
    let titleLabel = SKLabelNode(fontNamed: "Verdana-bold")
    let startLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    override func didMove(to view: SKView) {
        // 背景色をつける
        self.backgroundColor = UIColor.brown
        // タイトルを表示する
        titleLabel.text = "もぐらたたきゲーム"
        titleLabel.fontSize = 70
        titleLabel.position = CGPoint(x:375, y:900)
        self.addChild(titleLabel)
        // スタートボタンを表示する
        startLabel.text = "START"
        startLabel.fontSize = 60
        startLabel.position = CGPoint(x:375, y:300)
        self.addChild(startLabel)
    }
    
    // タッチしたときの処理 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)   // タッチした位置を調べて
            let touchNode = self.atPoint(location)  // その位置にあるものを調べる
            // もし、タッチした位置にあるものがスタートボタンなら
            if touchNode == startLabel {
                // GameSceneに切り換える
                let skView = self.view  //as SKView を消した
                let scene = GameScene(size: self.size)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                skView?.presentScene(scene) //エラーが出る
            }
        }
    }
}
