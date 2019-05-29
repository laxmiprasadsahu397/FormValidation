//
//  FormInputModel.swift
//  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import Foundation
import ObjectMapper

class FormInputModel: NSObject, Mappable{
    
    var name : String?
    var age : Int?
    var drivingSkill : Int?
    var height : Int?
    var birthDate : String?
    var nationality : String?
    var occupation : String?
    var postalCode : String?
    var vegetarian : Bool?
    
    
    required init?(map: Map){}
     override init(){}
    
    func mapping(map: Map) {
        name <- map["name"]
        age <- map["age"]
        drivingSkill <- map["drivingSkill"]
        height <- map["height"]
        nationality <- map["nationality"]
        birthDate <- map["birthDate"]
        occupation <- map["occupation"]
        postalCode <- map["postalCode"]
        vegetarian <- map["vegetarian"]
    }
        
}
