//
//  StudentViewController.swift
//  NIBMConnect
//
//  Created by R F on 5/20/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Kingfisher

class StudentViewController: UIViewController {
    
    var refStudents: DatabaseReference!
    var passFriend:StudentModel? = nil
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var studentTable: UITableView!
    
    var studentsList = [StudentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        refStudents = Database.database().reference()
        self.refStudents.child("students").observeSingleEvent(of: .value) { (snapshot) in
            //get user value
            
            let value = snapshot.value as? NSDictionary
            print(value)
            var students:[StudentModel] = []
            
            if snapshot.childrenCount > 0 {
                for student in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let studentObject = student.value as? [String:AnyObject]
                    let stu = StudentModel(id: studentObject!["id"] as? String, cityName:studentObject!["city"] as? String, firstName: studentObject!["fName"] as? String, lastName: (studentObject!["lName"] as! String), phoneno: studentObject!["phone"] as? String, fblink: studentObject!["fbLink"] as? String, fbpro: (studentObject!["pf"] as! String), bday: studentObject!["bDay"] as? String)
                    
                    students.append(stu)
                }
            }
            
            self.studentsList = students
            self.studentTable.reloadData()
        }
        
        self.studentTable.delegate = self
        self.studentTable.dataSource = self
        // Do any additional setup after loading the view.
        
        
        
        
    }
}

extension StudentViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell",for:indexPath)  as! StudentsDetailTableViewCell
        cell.set(friend: studentsList[indexPath.row])
        let url = URL(string: self.studentsList[indexPath.row].fbpro)
//        print(url)
        cell.profileImage.kf.setImage(with: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        passFriend = studentsList[indexPath.row]
        performSegue(withIdentifier: "studentProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentProfile"{
            
            if let viewController = segue.destination as? DetailViewController {
                viewController.studentObject = passFriend
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


