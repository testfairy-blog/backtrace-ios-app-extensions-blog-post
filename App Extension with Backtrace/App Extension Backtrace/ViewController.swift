//
//  ViewController.swift
//  App Extension Backtrace
//
//  Created by Diego Perini on 16.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField:UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textField?.becomeFirstResponder()
    }


}

