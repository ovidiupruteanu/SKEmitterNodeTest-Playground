// Playground - noun: a place where people can play

import SpriteKit
import XCPlayground

class GameScene: SKScene {
    
    let world = SKNode()
    let player = SKSpriteNode(imageNamed: "square.png")
    
    override func didMoveToView(view: SKView) {
        backgroundColor = NSColor.blackColor()
        physicsWorld.gravity = CGVectorMake(0, 0)
        
        addChild(world)
        
        
        player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size)
        player.physicsBody?.velocity = CGVectorMake(3000, 0)
        
        world.addChild(player)
        let particleEmitter = SKEmitterNode(fileNamed: "MyParticle.sks")
        particleEmitter.targetNode = world
        player.addChild(particleEmitter)

    }
    
    override func didFinishUpdate() {
        world.position = CGPoint(x: -player.position.x + CGRectGetMidX(frame),
            y: -player.position.y + CGRectGetMidY(frame))
    }
    
}

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
let scene = GameScene(size: CGSize(width: 500, height: 500))
sceneView.presentScene(scene)

XCPShowView("Test", sceneView)



