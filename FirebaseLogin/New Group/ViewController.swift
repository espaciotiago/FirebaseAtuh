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
    @IBOutlet weak var lblFeedBack: UILabel!
    
    var mail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFeedBack.isHidden = true
    }

    @IBAction func onLogin(_ sender: Any) {
        if let mail = txtMail.text, let password = txtPassword.text {
            FirebaseManager.onLoginWithFirebase(mail: mail, password: password, {completed,message in
                //Handle response
                if(completed){
                    self.mail = message
                    self.performSegue(withIdentifier: "gotoWellcome", sender: self)
                }else{
                    self.showMessage(noError: completed, message: message)
                }
            })
        }
    }
    @IBAction func onSignup(_ sender: Any) {
        if let mail = txtMail.text, let password = txtPassword.text {
            FirebaseManager.onSignupWithFirebase(mail: mail, password: password, { (completed, message) in
                //Handle response
                self.showMessage(noError: completed, message: message)
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is WellcomeViewController
        {
            let vc = segue.destination as? WellcomeViewController
            vc?.userMail = mail
        }
    }
    
    func showMessage(noError: Bool, message: String){
        if(noError){
            lblFeedBack.textColor = UIColor.green
            txtMail.text = ""
            txtPassword.text = ""
        }else{
            lblFeedBack.textColor = UIColor.red
        }
        lblFeedBack.text = message
        lblFeedBack.isHidden = false
    }
}

