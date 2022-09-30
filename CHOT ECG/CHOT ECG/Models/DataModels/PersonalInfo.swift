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
    let race : PersonalInfo.Race
    let age : Int
    
    static let standard = PersonalInfo(firstName: "John", lastName: "Doe", gender: .male, race: .caucasian, age: 50)

    enum Gender
    {
        case male, female, unspecified, other
        case custom(String)
    }
    
    // Need to find how they're defined on these scans
    enum Race
    {
        case caucasian, asian, black
    }
}

extension PersonalInfo
{
    var fullName : String { "\(self.firstName) \(self.lastName)"}
}
