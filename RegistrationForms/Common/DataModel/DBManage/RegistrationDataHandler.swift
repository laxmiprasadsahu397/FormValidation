//
//  RegistrationDataHandler.swift
//  RegistrationForms
//
//  Created by LaxmiPrasad Sahu on 28/05/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit
import CoreData

class RegistrationDataHandler: BAManagedObject {

 
    class func addOrUpdateSigninResponseEntity(inputFormModel: FormInputModel ) {
        let userEntity = NSEntityDescription.insertNewObject(forEntityName: "FormInput", into: BAManagedObject.getContext()) as? FormInput

        userEntity?.name = inputFormModel.name
        userEntity?.age = Int16(inputFormModel.age!)
        userEntity?.birthDate = inputFormModel.birthDate
        userEntity?.nationality = inputFormModel.nationality
        userEntity?.occupation = inputFormModel.occupation
        userEntity?.height = Int16(inputFormModel.height!)
        userEntity?.vegetarian = inputFormModel.vegetarian ?? false
        userEntity?.drivingSkill = Int16(inputFormModel.drivingSkill!)
        super.saveContext()
    }
    
    class func fetchFormList() -> [FormInput]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FormInput")
        var formEntities : [FormInput]?
        do
        {
            formEntities = try super.getContext().fetch(fetchRequest) as? [FormInput]
        }
        catch
        {
            
        }
        return formEntities
        
    }
    
}
