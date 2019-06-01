//
//  ForgotPasswordViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func getPassword(_ sender: Any) {
        if emailTxt.text!.isEmpty {
            print("please enter a email")
            return
        }else {
            
            Auth.auth().sendPasswordReset(withEmail: emailTxt.text!) { (error) in
                if (error != nil){
                    print(error?.localizedDescription)
                    
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
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
