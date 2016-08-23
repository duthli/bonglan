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
        //rollBall()
        moveBall()
    }

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
    var x = CGFloat()
    func rollBall(){
        let deltaAngle: CGFloat = 0.1
        rad = rad + deltaAngle * x
        ball.transform = CGAffineTransformMakeRotation(rad)
        //ball.center = CGPointMake(ball.center.x + (ballRadious * deltaAngle) , self.view.bounds.size.height * 0.5)
    }
    func moveBall(){
        UIView.animateWithDuration(4, animations: {
            self.ball.center = CGPointMake(self.view.bounds.size.width-32.0, self.yoffset + self.ballRadious)
                self.x = 1
            self.Random()
            })
        {(finished) in
            
            UIView.animateWithDuration(4, animations: {
                self.ball.center = CGPointMake(32.0, self.yoffset)
                self.x = -1
                })
            {(finished) in
                self.x = 1
                self.moveBall()
            }
        }
    }
//    func moveBalldaplai(){
//        UIView.animateWithDuration(4, animations: {
//            self.ball.center = CGPointMake(self.view.bounds.size.width-50, self.view.bounds.size.height * 0.5)
//            self.x = 1
//            })
//        {(finished) in
//            
//            UIView.animateWithDuration(4, animations: {
//                self.ball.center = CGPointMake(50, self.view.bounds.size.height * 0.5)
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
        let yheight = self.view.bounds.size.height - 50
        yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
    }
}

