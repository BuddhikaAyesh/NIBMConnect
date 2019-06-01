//
//  DetailViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/29/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var phoneNo: UILabel!
    @IBOutlet weak var fbLink: UILabel!
    @IBOutlet weak var bDay: UILabel!
    @IBOutlet weak var city: UILabel!
    
    var studentObject: StudentModel! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fName.text = studentObject.firstName
        lName.text = studentObject.lastName
        phoneNo.text = studentObject.phoneno
        fbLink.text = studentObject.fblink
        bDay.text = studentObject.bday
        city.text = studentObject.cityName
        let url = URL(string: studentObject!.fbpro)
        profileImage.kf.setImage(with: url)        // Do any additional setup after loading the view.
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
