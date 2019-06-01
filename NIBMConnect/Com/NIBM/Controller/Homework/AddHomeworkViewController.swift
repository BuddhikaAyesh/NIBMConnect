//
//  AddHomeworkViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/26/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit

class AddHomeworkViewController: UIViewController {

    @IBOutlet weak var titleHw: UITextField!
    @IBOutlet weak var descriptHw: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addHw(_ sender: Any) {
        let newHomeWork = HomeWork(titl: titleHw.text!, des: descriptHw.text!)
        HomeWork.saveHomeWork(homeWork: newHomeWork)
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
