//
//  HomeWorkViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit

class HomeWorkViewController: UIViewController,UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var homeworkTable: UITableView!
    var homeWorkArray:[HomeWork] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeWorkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let home = homeWorkArray[indexPath.row]
        
        let cell:HomeWorkCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeWorkCell
        
        
        cell.setupCell(title: home.title, des: home.description)
        
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeworkTable.delegate = self
        self.homeworkTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.homeworkTable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let arrayDetails = HomeWork.getHomeWork() {
            homeWorkArray = arrayDetails
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
