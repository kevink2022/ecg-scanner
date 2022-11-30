//
//  PersonalInfo.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import Foundation

/// Personal Info either grabbed directly from the document or manually inputted later
/// --Could provide some quick importing function but probably out of the scope of this project
struct PersonalInfo
{
    var firstName : String?
    var lastName : String?
    var gender : String?
    var race : String?
    var age : Int?
    
    static let standard = PersonalInfo(firstName: "John", lastName: "Doe", gender: "Male", race: "White", age: 50)
    static let empty = PersonalInfo()
    
    
    enum Gender
    {
        case male, female, unspecified, other
        case custom(String)
    }
}

extension PersonalInfo
{
    var fullName : String?
    {
        var name = ""
        
        if let first = self.firstName
        {
            name += first
        }
        
        name += " "
        
        if let last = self.lastName
        {
            name += last
        }
        
        if name == " "
        {
            return nil
        }
        else
        {
            return name
        }
    }
}
