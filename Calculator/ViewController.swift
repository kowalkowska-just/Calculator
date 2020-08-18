//
//  ViewController.swift
//  Calculator
//
//  Created by Justyna Kowalkowska on 17/08/2020.
//  Copyright © 2020 Justyna Kowalkowska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectButton: String = ""
    var textLabel: String = ""
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        
        selectButton = sender.currentTitle!
        textLabel.append(selectButton)
        
        resultLabel.text = textLabel
    
    }
}

