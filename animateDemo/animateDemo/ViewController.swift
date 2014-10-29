//
//  ViewController.swift
//  animateDemo
//
//  Created by Mel on 10/28/14.
//  Copyright (c) 2014 Melinda Po. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headImage: UIImageView!

    @IBOutlet weak var goButon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Couldn't in obj-C, but you can assign parts with Swift
    //blocks means code in parenthesis
    
    func chargeHead() {
        headImage.frame.origin.y += 300
        headImage.transform = CGAffineTransformMakeScale(2, 2)
    }

    @IBAction func onGoButtton(sender: AnyObject) {
        //start animation by using the charching function
        UIView.animateWithDuration(0.3, animations: {() -> Void in self.self.chargeHead()
            //now let it grow as dropping down - need scale
            }) //when finished, tilt/ or bob
            {(finished: Bool) -> Void in
                //start with it tilted back
                var angle = CGFloat(-10 * M_PI / 180)
                self.headImage.transform = CGAffineTransformRotate(self.headImage.transform, angle)
                //then rotate foward and transform with tilt and autoreverse
                
                UIView.animateWithDuration(0.4, delay: 0,
                    options:UIViewAnimationOptions.Repeat |
                    //This reverse the animation to the starting point for a smooth motion.
                    UIViewAnimationOptions.Autoreverse, animations: { () -> Void in
                    var angle = CGFloat(30 * M_PI / 180)
                    self.headImage.transform = CGAffineTransformRotate(self.headImage.transform, angle)
                    }, completion: nil)
                
        }
        
    }
}

