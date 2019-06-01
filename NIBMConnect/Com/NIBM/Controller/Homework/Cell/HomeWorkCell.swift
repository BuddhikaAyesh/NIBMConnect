//
//  HomeWorkCell.swift
//  NIBMConnect
//
//  Created by R F on 5/26/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit

class HomeWorkCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var descript: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(title:String, des:String){
        self.title.text = title
        self.descript.text = des
    }

}
