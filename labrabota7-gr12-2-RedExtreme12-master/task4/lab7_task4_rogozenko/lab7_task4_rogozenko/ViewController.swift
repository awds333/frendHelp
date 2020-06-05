//
//  ViewController.swift
//  lab7_task4_rogozenko
//
//  Created by Dmitriy on 4/10/20.
//  Copyright © 2020 Dmitriy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textfield = UITextField()
    let switcher = UISwitch()
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        switcher.frame = CGRect(x: self.view.frame.maxX / 2 - 25, y: 100, width: 100, height: 50)
        self.view.addSubview(switcher)
        
        
        textfield.frame = CGRect(x: self.view.frame.maxX / 2 - 70, y: 200, width: 140, height: 50)
        
        textfield.placeholder = "Enter amount"
        
        self.view.addSubview(textfield)
        
        label.frame = CGRect(x: self.view.frame.maxX / 2 - 75, y: 300, width: 150, height: 50)
        label.textAlignment = .center
        self.view.addSubview(label)
        
        button.frame = CGRect(x: self.view.frame.maxX / 2 - 75, y: 400, width: 150, height: 50)
        button.setTitle("Process", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(button_func), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func button_func(sender: UIButton) {
        let input_value = Float(textfield.text!)
        
        if (!switcher.isOn) {
            label.text = ("\(input_value! * 1.6) KM")
            self.view.backgroundColor = .lightGray
        } else {
            label.text = ("\(input_value! * 0.62) Miles")
            self.view.backgroundColor = .white
        }
    }

}

