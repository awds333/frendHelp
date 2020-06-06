//
//  ViewController.swift
//  Task2.1
//
//  Created by Pavel Bandiuk on 22.05.2020.
//  Copyright © 2020 Pavel Bandiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var regView: UIView!
    @IBOutlet weak var rePasswordL: UITextField!
    @IBOutlet weak var passwordL: UITextField!
    @IBOutlet weak var loginL: UITextField!
    @IBOutlet weak var passwordR: UITextField!
    @IBOutlet weak var loginR: UITextField!
    @IBOutlet weak var buttonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if ((UserDefaults.standard.string(forKey: "login") != nil) && (UserDefaults.standard.string(forKey: "password") != nil)) {
            print("Success")
            self.performSegue(withIdentifier: "mainVC", sender: self)
        }
    }
    @IBAction func segment(_ sender: Any) {
        if(segmentedControll.selectedSegmentIndex == 0) {
            regView.isHidden = true
             buttonOutlet.titleLabel?.text = NSLocalizedString("Sign in", comment: "")
        } else {
            regView.isHidden = false
            buttonOutlet.titleLabel?.text = NSLocalizedString("Sign up", comment: "")
        }
    }
    
    @IBAction func `switch`(_ sender: Any) {
    }
    
    @IBAction func buttonFunc(_ sender: Any) {
        if (switcher.isOn) {
            let login = loginL.text!
            let password = passwordL.text
            
            UserDefaults.standard.set(login, forKey: "login")
            UserDefaults.standard.set(password, forKey: "password")
            self.performSegue(withIdentifier: "mainVC", sender: self)
        } else {
            return
        }
    }
}

