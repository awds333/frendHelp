//
//  ViewController.swift
//  lab8_task_1.4
//
//  Created by Pavel on 4/21/20.
//  Copyright © 2020 pavel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gestureIndicator: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureIndicator.isUserInteractionEnabled = true
        gestureIndicator.numberOfLines = 2
        gestureIndicator.text = "Используйте жесты в этой области"
        gestureIndicator.backgroundColor = .yellow
    }

    @IBAction func tap(_ sender: Any) {
        gestureIndicator.text = "Жест: касание\n Цвет фона: зеленый"
        gestureIndicator.backgroundColor = .green
    }
    
    @IBAction func long_press(_ sender: Any) {
        gestureIndicator.text = "Жест: долгое нажатие\n Цвет фона: оранжевый"
        gestureIndicator.backgroundColor = .orange
    }
    @IBAction func pinch(_ sender: Any) {
        gestureIndicator.text = "Жест: масштабирование\n Цвет фона: красный"
        gestureIndicator.backgroundColor = .red
    }
    
    @IBAction func rotation(_ sender: Any) {
        gestureIndicator.text = "Жест: вращение\n Цвет фона: синий"
        gestureIndicator.backgroundColor = .blue
    }
    
    @IBAction func swipe(_ sender: Any) {
        gestureIndicator.text = "Жест: смахивание\n Цвет фона: серый"
        gestureIndicator.backgroundColor = .lightGray
    }
}

