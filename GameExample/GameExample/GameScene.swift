//
//  GameScene.swift
//  GameExample
//
//  Created by Valerio Pauciullo on 12/10/2018.
//  Copyright © 2018 Valerio Pauciullo. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    /*Variabile bear di tipo classe SKSpriteNode() */
    private var bear = SKSpriteNode()
    private var bear2 = SKSpriteNode()
    /*Array di frame di tipo SKTexture*/
    private var bearWalkingFrames: [SKTexture] = []
    
    
//    var cameraNode = SKCameraNode()
//    var player = SKSpriteNode(color: UIColor.red, size: CGSize(width: 32, height: 32))
//    var player2 = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 32, height: 32))
//
//        //nodo principale all'interno della SKView
//    let node = SKNode()
//        //variabile sprite di SKSpriteNode di colore UIColor.red e grandezza CGSize(width, height)
//    let sprite = SKSpriteNode(color: UIColor.red, size: CGSize(width: 64, height: 64))
//
//        //Secondo nodo da inserire nella SKView
//    let node2 = SKNode()
//        //Seconda variabile di SKSpriteNode di colore blue
//    let sprite2 = SKSpriteNode(color: UIColor.blue, size: CGSize(width: 64, height: 64))
//
//    let cam = SKCameraNode()
//
//    override func didMove(to view: SKView) {
//        super.didMove(to: view)
//        self.camera = cameraNode
//        cameraNode.position = player2.position
//
//        player.position = CGPoint(x: frame.midX, y: frame.midY)
//
//        player2.position = CGPoint(x: frame.midX/2, y: frame.midY/3)
//
//        addChild(player)
//
//        addChild(player2)
//
//        addChild(cameraNode)
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//        super.touchesBegan(touches, with: event)
//
//        if(!player2.hasActions())
//        {
//            player2.run(SKAction.move(to: CGPoint(x: 0, y: 20), duration: 3))
//
////        if let location = touches.first?.location(in: self) {
////            player.run(SKAction.move(to: location, duration: 1.0))
////        }
//        }

        
//    }
////
//        func update(_ currentTime: TimeInterval) {
//        super.update(currentTime)
//
//        cameraNode.position = player2.position
//    }
    
//    override func didMove(to view: SKView)
//    {
//        //Aggiunta del nodo di SKNode dentro la SKView
////        addChild(node)
//        addChild(node2)
//        addChild(node)
//
//        self.camera = cam
//
//          //Aggiunta della posizione dello sprite di posizione Core Graphics Point (CGpoint(x, y))
//        sprite.position = CGPoint(x: 240, y: 240)
//        sprite2.position = CGPoint(x: frame.midX, y: frame.midY)
//          //Aggiunta dello sprite SKSpriteNode come child della SKScene
//        addChild(sprite)
//        addChild(sprite2)
//
//        sprite.addChild(cam)
//    }
//
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//            /*
//             Metodo per muovere lo sprite.
//             Attraverso il metodo .run interroghiamo la classe SKSpriteNode che, a sua volta
//             richiama il metodo move che ci permette di muoverci di attraverso la Core Graphics
//             */
//        cam.move(toParent: sprite2)
//
//        sprite.run(SKAction.move(to: sprite2.position, duration: 3))
//
//            /*
//             Metodo per muovere e ruotare lo sprite
//             Sempre attraverso il metodo .run della classe SKSpriteNode, questa volta
//             effettueremo una rotazione attraverso il metodo .rotate e la Core Graphics
//             */
////      sprite.run(SKAction.rotate(byAngle: CGFloat(.pi/2.0), duration: 1))
//    }

    
    
    override func didMove(to view: SKView)
    {
        /*Chiamata al metodo buildBear()*/
        buildBear()
        animateBear()
    }
    
    /*Funzione buildBear/(*/
    func buildBear()
    {
        /*Costante SKTexture Altas per prelevare i frame nella cartella atlas del progetto*/
        let bearAnimatedAtlas = SKTextureAtlas(named: "neurone")
        /*Array walkFrames di tipo SkTexture*/
        var walkFrames: [SKTexture] = []

        /*Costante che contiene il numero di frame all'interno dell'atlas*/
        let numImages = bearAnimatedAtlas.textureNames.count
        /*Scorro il vettore dei frame dentro l'atlas di come "Run(i)"
         e li aggiungo all'array dei frame "walkFrame" in appendice*/
        for i in 1...numImages {
            let bearTextureName = "\(i)"
            walkFrames.append(bearAnimatedAtlas.textureNamed(bearTextureName))
        }
        

        /*L'array dei frame eseguiti è uguale all'array dei frame iniziali*/
        bearWalkingFrames = walkFrames
        /*Seleziona la prima texture*/
        let firstFrameTexture = bearWalkingFrames[0]
        bear = SKSpriteNode(texture: firstFrameTexture)
        bear2 = SKSpriteNode(texture: firstFrameTexture)
        /*Posizionamento del primo frame nello screen*/
        bear.position = CGPoint(x: -220, y: frame.midY)
        
        bear2.position = CGPoint(x : 220, y: frame.midY)
        

        
        /*Grandezza del frame */
        bear.size = CGSize(width: 190, height: 190)
        bear2.size = CGSize(width: 190, height: 190)
        addChild(bear)
        addChild(bear2)
    }

    /*Funzione per animare l'oggetto bear attraverso la classe SKAction.repeatForever e SKAction.animation*/
    func animateBear() {
        bear.run(SKAction.repeatForever(
            SKAction.animate(with: bearWalkingFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
                 withKey:"walkingInPlaceBear")
        
        
        bear2.run(SKAction.repeatForever(
            SKAction.animate(with: bearWalkingFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
                 withKey:"walkingInPlaceBear2")
    }

//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        bear.size = CGSize(width: 190, height: 190)
//        bear2.size = CGSize(width: 190, height: 190)
//        addChild(bear2)
//
//        //        bear.xScale = abs(bear.xScale) * multiplierForDirection
//        animateBear()
//    }

//    /*Metodo nativo "touchesEndend"*/
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first!
//        let location = touch.location(in: self)
//
////        var multiplierForDirection: CGFloat
////        if location.x < frame.midX {
////            // walk left
////            multiplierForDirection = 1.0
////        } else {
////            // walk right
////            multiplierForDirection = -1.0
////        }
//        bear.size = CGSize(width: 190, height: 190)
//        bear2.size = CGSize(width: 190, height: 190)
//        addChild(bear2)
//
////        bear.xScale = abs(bear.xScale) * multiplierForDirection
//        animateBear()
//    }
////
//    //nodo principale all'interno della SKView
//    let node = SKNode()
//    //variabile sprite di SKSpriteNode di colore UIColor.red e grandezza CGSize(width, height)
//    let sprite = SKSpriteNode(color: UIColor.red, size: CGSize(width: 200, height: 200))
//    //Carico l'immagine nella root della cartella del progetto come SKSpriteNode
//    let spriteTexture = SKSpriteNode(imageNamed: "truck")
//
//
//    override func didMove(to view: SKView)
//    {
      //Aggiunta del nodo di SKNode dentro la SKView
//      addChild(node)
//      //Aggiunta della posizione dello sprite di posizione Core Graphics Point (CGpoint(x, y))
//      sprite.position = CGPoint(x: frame.midX, y: frame.midY)
//
//      //Aggiunta dello sprite SKSpriteNode come child della SKScene
//      addChild(sprite)
//
//      //Modifico il size della texture con Core Graphics
//      spriteTexture.size = CGSize(width: 32, height: 32)
//      //Aggiungo allo sprite come nodo child la texture dell'immagine caricata prima
//      sprite.addChild(spriteTexture)
//    }
//
//    /*
//     Metodo "touchesBegan()" per avviare il tocco del touch sull'oggetto
//     In questo caso l'oggetto che andremo a toccare sarà il nostro sprite
//     che, nel corpo della funzione stessa, attraverso il metodo .run
//     ci permetterà di effettuare una action con SKAction [vedi dopo]
//     */
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
//    {
//        /*
//         Metodo per muovere lo sprite.
//         Attraverso il metodo .run interroghiamo la classe SKSpriteNode che, a sua volta
//         richiama il metodo move che ci permette di muoverci di attraverso la Core Graphics
//         */
//        spriteTexture.run(SKAction.move(to: CGPoint(x: 0, y: 120), duration: 3))
//
//        /*
//         Metodo per muovere e ruotare lo sprite
//         Sempre attraverso il metodo .run della classe SKSpriteNode, questa volta
//         effettueremo una rotazione attraverso il metodo .rotate e la Core Graphics
//         */
//        spriteTexture.run(SKAction.rotate(byAngle: CGFloat(.pi/2.0), duration: 1))
//    }
}
