//
//  MyProfileViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
       // self.dismiss(animated: true, completion: nil)
        let loginVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
   
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

