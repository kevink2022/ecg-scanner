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
    var titleFont : Font
    var content : () -> Content
    @State var showContent : Bool = false
    
    
    var body: some View
    {
        VStack(alignment: .leading)
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
                        .font(titleFont)
                    
                    Spacer()
                }
            }
            
            if showContent
            {
                HStack
                {
                    // To offset the drop down content
                    Image(systemName: C.shownLabel)
                        .opacity(0)
                    
                    content()
                }
            }
        }
        .padding(C.outerPadding)
    }
}

//struct DropDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        DropDownView()
//    }
//}

