//
//  WelcomeViewController.swift
//  CodeChallenge
//
//  Created by Abu Hamdan on 11/16/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCloseAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
