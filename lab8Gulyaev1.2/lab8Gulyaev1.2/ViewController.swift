//
//  ViewController.swift
//  lab8Gulyaev1.2
//
//  Created by fpmi on 6/5/20.
//  Copyright © 2020 fpm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let squearPath = UIBezierPath()
        squearPath.move(to: CGPoint(x: 100, y: 100))
        squearPath.addLine(to: CGPoint(x: 200, y: 100))
        squearPath.addLine(to: CGPoint(x: 200, y: 200))
        squearPath.addLine(to: CGPoint(x: 100, y: 200))
        
        squearPath.close()
        let squear = CAShapeLayer()
        squear.path = squearPath.cgPath
        squear.fillColor = UIColor.red.cgColor
        self.view.layer.addSublayer(squear)
    }


}

