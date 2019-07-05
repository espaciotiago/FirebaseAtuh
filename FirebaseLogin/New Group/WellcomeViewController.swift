//
//  WellcomeViewController.swift
//  FirebaseLogin
//
//  Created by Santiago Moreno on 7/5/19.
//  Copyright © 2019 Tiago. All rights reserved.
//

import UIKit

class WellcomeViewController: UIViewController {
    
    
    @IBOutlet weak var lblWellcome: UILabel!
    
    var userMail: String? {
        didSet {
            if let mail = self.userMail?.split(separator: "@") {
                if !mail.isEmpty{
                    self.userMail = String(mail[0])
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let mail = userMail {
            lblWellcome.text = "Wellcome \(mail)!"
        }
    }

}
