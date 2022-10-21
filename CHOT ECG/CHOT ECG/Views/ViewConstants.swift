//
//  ViewConstants.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/21/22.
//

import SwiftUI

struct ViewConstants
{
    struct CropPoint
    {
        static let diameter : CGFloat = 35
        static let opacity  : CGFloat = 0.3
    }
    
    struct MainMenuButton
    {
        static let cornerRadius : CGFloat = 15
        static let strokeWidth  : CGFloat = 3
        static let padding      : CGFloat = 15
        static let font         : Font    = .largeTitle.bold()
        
        struct NewScan
        {
            static let label = "New Scan"
            static let image = "doc.badge.plus"
        }
        
        struct CropScan
        {
            static let label = "Crop Scans"
            static let image = "crop"
        }
        
        struct ViewScans
        {
            static let label = "View Scans"
            static let image = "doc.on.doc"
        }
    }
    
    struct Colors
    {
        static let lightBlue = Color(
            red:   164 / 255,
            green: 203 / 255,
            blue:  235 / 255
        )
        
        static let darkBlue = Color(
            red:   1   / 255,
            green: 91  / 255,
            blue:  159 / 255
        )
    }
    
    struct DropDownView
    {
        static let hiddenLabel = "chevron.right.circle"
        static let shownLabel = "chevron.down.circle"
        static let titleFont = Font.system(.title, design: .default, weight: .bold)
    }

}
