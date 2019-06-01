//
//  LandingViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/19/19.
//  Copyright © 2019 Buddhika Ayesh . All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                self.performSegue(withIdentifier: "showLogin", sender: nil)
            } else {
                
                self.performSegue(withIdentifier: "showHome", sender: nil)
            }
        }
        
        func viewWillAppear(_ animated: Bool) {
            AppTempData.userHandle = Auth.auth().addStateDidChangeListener { (auth, user) in
                // ...
                
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
