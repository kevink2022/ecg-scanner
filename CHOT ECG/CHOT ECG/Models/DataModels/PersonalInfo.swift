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
    let firstName : String
    let lastName : String
    let gender : PersonalInfo.Gender
    let race : String
    let age : Int
    
    static let standard = PersonalInfo(firstName: "John", lastName: "Doe", gender: .male, race: "White", age: 50)

    enum Gender
    {
        case male, female, unspecified, other
        case custom(String)
    }
}

extension PersonalInfo
{
    var fullName : String { "\(self.firstName) \(self.lastName)"}
}
