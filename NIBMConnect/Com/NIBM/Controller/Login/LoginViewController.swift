//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/19/19.
//  Copyright © 2019 Buddhika Ayesh . All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate  {

    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var pwdTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    @IBAction func loginClick(_ sender: Any) {
        if (emailTxt.text == "" || pwdTxt.text == "") {
            print("Please Fill in the details")
            return
            
        }else{
            
            Auth.auth().signIn(withEmail: emailTxt.text!, password: pwdTxt.text!) { [weak self] user, error in
               // guard let strongSelf = self else { return }
                
                if (error != nil){
                    print("Error")
                }else{
                    self!.performSegue(withIdentifier: "showHome", sender: self)
                }
            }
            
            
        }
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                print(error)
                let alert = UIAlertController(title: "Login Error!", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            self.dismiss(animated: true, completion: nil)
            print(authResult!.user.email!)
            print(authResult!.user.displayName as Any)
        }
        
    }
        
        

        // Do any additional setup after loading the view.
}



