//
//  MainMenuButton.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/18/22.
//

import SwiftUI

struct MainMenuButton: View
{
    typealias C = ViewConstants
    typealias ButtonC = C.MainMenuButton
    let label : String
    let image : String
    
    var body: some View
    {
        ZStack
        {
            RoundedRectangle(cornerRadius: ButtonC.cornerRadius)
                .foregroundColor(C.Colors.lightBlue)
            
            RoundedRectangle(cornerRadius: ButtonC.cornerRadius)
                .stroke(style: StrokeStyle(lineWidth: ButtonC.strokeWidth))
                .foregroundColor(C.Colors.darkBlue)
            
            HStack
            {
                Text(label)
                Spacer()
                Image(systemName: image)
            }
            .font(ButtonC.font)
            .foregroundColor(C.Colors.darkBlue)
            .padding()
        }
        .padding(ButtonC.padding)
    }
}

struct MainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuButton(label: "New Scan", image: "doc.badge.plus")
    }
}
