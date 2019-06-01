//
//  HomeWork.swift
//  NIBMConnect
//
//  Created by R F on 5/26/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//

import Foundation
import UIKit

class HomeWork : Codable{
    
    var title:String
    var description:String
    
    init(titl:String, des:String) {
        self.title = titl
        self.description = des
    }
    
    
    public static func getHomeWork() -> [HomeWork]? {
        
        var homeWorkArray:[HomeWork] = []
        if let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
            homeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        return homeWorkArray
    }
    
    
    public static func saveHomeWork(homeWork:HomeWork){
        var retrivedHomeWorkArray:[HomeWork] = []
        
        if  let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
            retrivedHomeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        
        
        if retrivedHomeWorkArray.count == 0 {
            
            var homeWorkArray = [HomeWork]()
            homeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(homeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
        }else{
            
            retrivedHomeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(retrivedHomeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
            
        }
        
        
    }
}




