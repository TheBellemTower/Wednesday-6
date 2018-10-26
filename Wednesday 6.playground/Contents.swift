


// Created on: Nov-2017
// Created by: Ethan Bellem
// Created for: ICS3U
// This program is a SpriteKit template

// this will be commented out when code moved to Xcode
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit

class SplashScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let background = SKSpriteNode(imageNamed: "IMG_2066.JPG")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 2.0)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1)
        background.position = CGPoint(x: screenSize.width / 2, y: 200)
        background.name = "Background"
        self.addChild(background)
        background.setScale(1)
        
        background.run(moveToNextSceneDelay){
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
        }
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let mainMenuScene = MainMenuScene(size: self.size)
        self.view!.presentScene(mainMenuScene)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let startButton = SKSpriteNode(imageNamed: "IMG_2181.PNG")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 0, green:7, blue:3, alpha: 0)
        startButton.position = CGPoint(x: screenSize.width / 2, y: 150)
        startButton.name = "start button"
        self.addChild(startButton)
        startButton.setScale(0.65)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "start button" {
                let gameScene = GameScene(size: self.size)
                self.view!.presentScene(gameScene)
            }
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    // local variables to this scene
    let ship = SKSpriteNode(imageNamed: "spaceShip.png")
    let rightButton = SKSpriteNode(imageNamed: "rightButton.png")
    let leftButton = SKSpriteNode(imageNamed: "leftButton.png")
    
    var rightButtonClicked = false
    var leftButtonClicked = false
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        /* Setup your scene here */
        self.backgroundColor = SKColor(red: 1, green:1, blue:1, alpha: 1)
        
        ship.position = CGPoint(x: screenSize.width / 2, y: 100)
        ship.name = "space ship"
        self.addChild(ship)
        ship.setScale(0.65)
        
        rightButton.position = CGPoint(x: 300, y: 100)
        rightButton.name = "right button"
        self.addChild(rightButton)
        rightButton.setScale(0.7)
        rightButton.alpha = 0.5
        
        leftButton.position = CGPoint(x: 100, y: 100)
        leftButton.name = "left button"
        self.addChild(leftButton)
        leftButton.setScale(0.7)
        leftButton.alpha = 0.5
        
        ship.run(SKAction.playSoundFileNamed("BarrelExploding.wav", waitForCompletion: false))
    }
    
    override func  update(_ currentTime: TimeInterval) {
        // move ship if buttons are clicked 
        if rightButtonClicked == true && ship.position.x <= screenSize.width - 150 {
            var moveShipRight = SKAction.moveBy(x: 10, y: 0, duration: 0.1)
            ship.run(moveShipRight)
        } else if leftButtonClicked == true && ship.position.x >= 50 {
            var moveShipLeft = SKAction.moveBy(x: -10, y: 0, duration: 0.1)
            ship.run(moveShipLeft)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // check if buttons are clicked
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "right button" {
                rightButtonClicked = true 
            } else if nodeTouchedName == "left button" {
                leftButtonClicked = true
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // check if buttons stopped being pressed
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var nodeTouched = self.atPoint(location)
        
        if let nodeTouchedName = nodeTouched.name{
            if nodeTouchedName == "right button" {
                rightButtonClicked = false 
            } else if nodeTouchedName == "left button" {
                leftButtonClicked = false
            }
        }
    }
}

// this will be commented out when code moved to Xcode
// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
