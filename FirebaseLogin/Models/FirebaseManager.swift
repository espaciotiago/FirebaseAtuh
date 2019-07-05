
//
//  FirebaseManager.swift
//  FirebaseLogin
//
//  Created by Tiago on 7/4/19.
//  Copyright © 2019 Tiago. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    
    static func onLoginWithFirebase(mail: String, password: String, _ completion:(Bool
        ,String)->Void){
        
    }
    
    static func onSignupWithFirebase(mail: String, password: String, _ completion: @escaping (Bool
        ,String)->Void){
        Auth.auth().createUser(withEmail: mail, password: password) { (result, error) in
            if let err = error  {
                completion(false,err.localizedDescription)
                return
            }else{
                completion(true,"Usuario registrado correctamente")
            }
        }
    }
}
