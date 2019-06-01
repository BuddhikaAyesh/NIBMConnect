//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/19/19.
//  Copyright © 2019 Buddhika Ayesh. All rights reserved.
//

import UIKit
import LocalAuthentication
import FirebaseAuth

@IBDesignable
class DesignableButton: UIButton {
}

class HomeViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var studentsImg: UIImageView!
    @IBOutlet weak var hwImg: UIImageView!
    
    @IBOutlet weak var signOut: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        studentsImg.layer.cornerRadius = studentsImg.frame.size.width/2
        hwImg.layer.cornerRadius = hwImg.frame.size.width/2
        profileImg.clipsToBounds = true
        studentsImg.clipsToBounds = true
        profileImg.clipsToBounds = true
        
    }
    
    @IBAction func signOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        performSegue(withIdentifier: "showLogin", sender: nil)
    }
    
    func authenticateUser() {
        let myContext = LAContext()
        let myLocalizedReasonString = "NiBM Connect"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) {
                myContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
                    
                    DispatchQueue.main.async {
                        if success {
                            // User authenticated successfully, take appropriate action
                            self.performSegue(withIdentifier: "showMyProfile", sender: nil)
                            
                        } else {
                            
                            print(evaluateError?.localizedDescription)
                        }
                    }
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
        }
    }
    
    @IBAction func btnProfile(_ sender: Any) {
        authenticateUser()
    }
    
    @IBAction func studentAction(_ sender: Any) {
        self.performSegue(withIdentifier: "showStudents", sender: nil)
    }
    
    @IBAction func homework(_ sender: Any) {
        self.performSegue(withIdentifier: "showHomework", sender: nil)
    }

}

    
extension UIButton{
        @IBInspectable
        var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
            }
        }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}
    
  


