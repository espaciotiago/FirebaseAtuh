//
//  ViewController.swift
//  FirebaseLogin
//
//  Created by Tiago on 7/4/19.
//  Copyright © 2019 Tiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onLogin(_ sender: Any) {
        if let mail = txtMail.text, let password = txtPassword.text {
            FirebaseManager.onLoginWithFirebase(mail: mail, password: password, {completed,message in
                //Handle response
            })
        }
    }
    @IBAction func onSignup(_ sender: Any) {
        if let mail = txtMail.text, let password = txtPassword.text {
            FirebaseManager.onSignupWithFirebase(mail: mail, password: password, { (completed, message) in
                //Handle response
            })
        }
    }
}

