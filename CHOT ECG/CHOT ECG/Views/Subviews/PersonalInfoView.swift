//
//  PersonalInfoView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/23/22.
//

import SwiftUI

struct PersonalInfoView: View
{
    typealias C = ViewConstants.PersonalInfo
    let info : PersonalInfo
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            if let name = info.fullName { Text("Name: \(name)")}
            else { Text("Name: REDACTED") }
            if let age = info.age { Text("Age: \(age)") }
            //Text("Race: \(info.race)")
            //Text("Gender: \(info.gender)")
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalInfoView(info: PersonalInfo.standard)
    }
}

extension ViewConstants
{
    struct PersonalInfo
    {
        static let font : Font = .system(.body, design: .default, weight: .regular)
    }
}
