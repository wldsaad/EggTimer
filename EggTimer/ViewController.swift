//
//  ViewController.swift
//  EggTimer
//
//  Created by Waleed Saad on 12/19/18.
//  Copyright © 2018 Waleed Saad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    private let initialNumber = 200
    private var timer = Timer()
    private var number = 200
    private var isTimerOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumber()
    }
    
    private func updateNumber(){
        numberLabel.text = String(number)
    }

    @IBAction func startAction(_ sender: Any) {
        if !isTimerOn {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
            isTimerOn = true
        }
    }
    
    @objc private func startTimer(){
        if number >= 1 {
            number -= 1
            updateNumber()
        } else {
            timer.invalidate()
            isTimerOn = false
        }
    }
    @IBAction func stopAction(_ sender: Any) {
        if isTimerOn{
            timer.invalidate()
            isTimerOn = false
        }
    }
    
    @IBAction func increase10Action(_ sender: UIBarButtonItem) {
        number += 10
        updateNumber()
    }
    
    @IBAction func decrease10Action(_ sender: Any) {
        if number >= 10 {
            number -= 10
            updateNumber()
        }
    }
    
    @IBAction func resetAction(_ sender: Any) {
        number = initialNumber
        updateNumber()
    }
    
}

