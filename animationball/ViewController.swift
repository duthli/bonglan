//
//  ViewController.swift
//  animationball
//
//  Created by do duy hung on 23/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var rad = CGFloat()
    var ballRadious = CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let time = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector (rollBall), userInfo: nil, repeats: true)

        addBall()
        rollBall()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addBall(){
    let ViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ball.center = CGPointMake(ballRadious, ViewSize.height * 0.5)
        self.view.addSubview(ball)
    }
    
    var deltaAngle: CGFloat = 0.1
    func rollBall(){
        //var deltaAngle: CGFloat = 0.1
        rad = rad + deltaAngle
        ball.transform = CGAffineTransformMakeRotation(rad)
//        ball.center = CGPointMake(ball.center.x + (ballRadious * deltaAngle * x) , self.view.bounds.size.height * 0.5)
        ball.center.x = ball.center.x + (ballRadious * deltaAngle)
        ball.center.y = ball.center.y + (yoffset * deltaAngle)
        if(ball.center.x > self.view.bounds.size.width - ballRadious || ball.center.y > self.view.bounds.size.height){
            deltaAngle = -0.1
            Random()
            
            if(yoffset > self.view.bounds.size.width){
                deltaAngle = deltaAngle / yoffset/ball.center.y
            }
        }
        if (ball.center.x < ballRadious || ball.center.y < ballRadious){
            deltaAngle = 0.1
            Random()
            if(yoffset > self.view.bounds.size.width){
                deltaAngle = deltaAngle / yoffset/ball.center.y
            }
        }
    }
//    func moveBall(){
//        UIView.animateWithDuration(4, animations: {
//            self.ball.center = CGPointMake(self.view.bounds.size.width-32.0, self.yoffset + self.ballRadious)
//                self.x = 1
//            self.Random()
//            })
//        {(finished) in
//            
//            UIView.animateWithDuration(4, animations: {
//                self.ball.center = CGPointMake(32.0, self.yoffset)
//                self.x = -1
//                })
//            {(finished) in
//                self.x = 1
//                self.moveBall()
//            }
//        }
//    }
    var yoffset = CGFloat()
    func Random(){
        let yheight = self.view.bounds.size.height - ballRadious
        yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
    }
}

