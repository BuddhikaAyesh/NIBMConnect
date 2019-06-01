//
//  StudentsDetailTableViewCell.swift
//  NIBMConnect
//
//  Created by R F on 5/22/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit
import Firebase

class StudentsDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var fName: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var cityName: UILabel!
   
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(friend: StudentModel){
        fName.text = friend.firstName
        lName.text = friend.lastName
        cityName.text = friend.cityName
    }
}
