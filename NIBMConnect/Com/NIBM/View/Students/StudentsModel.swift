//
//  StudentsModel.swift
//  NIBMConnect
//
//  Created by R F on 5/22/19.
//  Copyright © 2019 Buddhika Ayesh -COMBBSCComp171P-014. All rights reserved.
//
import Foundation

class StudentModel{
    var id:String?
    var cityName: String?
    var firstName: String?
    var lastName : String?
    var phoneno : String?
    var fbpro : String
    var fblink: String?
    var bday : String?
    
    
    
    init(id:String?,cityName:String?, firstName:String?,lastName:String?,phoneno:String?,fblink:String?,fbpro:String,bday:String?){
        self.id = id
        self.cityName = cityName
        self.firstName = firstName
        self.lastName = lastName
        self.phoneno = phoneno
        self.fbpro = fbpro
        self.fblink = fblink
        self.bday = bday
        
        
    }
}
