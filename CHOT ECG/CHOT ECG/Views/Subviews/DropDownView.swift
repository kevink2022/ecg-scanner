//
//  DropDownView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 10/21/22.
//

import SwiftUI

struct DropDownView<Content: View>: View
{
    typealias C = ViewConstants.DropDownView
    let title : String
    @ViewBuilder var content : Content
    @State var showContent : Bool = false
    
    var body: some View
    {
        VStack
        {
            Button
            {
                withAnimation { showContent.toggle() }
            }
            label:
            {
                HStack
                {
                    Image(systemName: showContent ? C.shownLabel : C.hiddenLabel)
                    
                    Text(title)
                        .font(C.titleFont)
                    
                    Spacer()
                }
            }
            
            if showContent
            {
                content
            }
        }
    }
}

//struct DropDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropDownView()
//    }
//}

