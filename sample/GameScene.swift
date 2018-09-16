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
    
    override func didMove(to view: SKView) {
        self.backgroundColor = SKColor(red: 0.9, green: 0.84, blue: 0.71, alpha: 1)
        
        for i in 0...4 {
            let hole = SKSpriteNode(imageNamed: "mog1.png")
            hole.position = CGPoint(x:mogPoint[i][0], y:mogPoint[i][1])
            self.addChild(hole)
            
            let mog = SKSpriteNode(imageNamed: "mog2.png")
            mog.position = CGPoint(x:mogPoint[i][0], y:mogPoint[i][1])
            self.addChild(mog)
            
            mogArray.append(mog)
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
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
