//
//  SignalView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 12/4/22.
//

import SwiftUI
import Charts

struct SignalView: View
{
    let signals : ECGSignal
    
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                VStack
                {
                    DropDownView(title: "I"  , titleFont: .title2) { SignalChart(signal: signals.I  ) }
                    DropDownView(title: "II" , titleFont: .title2) { SignalChart(signal: signals.II ) }
                    DropDownView(title: "III", titleFont: .title2) { SignalChart(signal: signals.III) }
                    DropDownView(title: "aVF", titleFont: .title2) { SignalChart(signal: signals.aVF) }
                    DropDownView(title: "aVL", titleFont: .title2) { SignalChart(signal: signals.aVL) }
                    DropDownView(title: "aVR", titleFont: .title2) { SignalChart(signal: signals.aVR) }
                }
                VStack
                {
                    DropDownView(title: "V1", titleFont: .title2) { SignalChart(signal: signals.V1) }
                    DropDownView(title: "V2", titleFont: .title2) { SignalChart(signal: signals.V2) }
                    DropDownView(title: "V3", titleFont: .title2) { SignalChart(signal: signals.V3) }
                    DropDownView(title: "V4", titleFont: .title2) { SignalChart(signal: signals.V4) }
                    DropDownView(title: "V5", titleFont: .title2) { SignalChart(signal: signals.V5) }
                    DropDownView(title: "V6", titleFont: .title2) { SignalChart(signal: signals.V6) }
                }
            }
        }
    }
    
    private struct SignalChart: View
    {
        let signal : [Double]
        
        var body: some View
        {
            Chart
            {
                ForEach(0..<signal.endIndex, id: \.self)
                {
                    index in
                    
                    LineMark(
                        x: .value("X", index),
                        y: .value("Y", signal[index])
                    )
                }
            }
            .frame(height: C.graphFrameHeight)
        }
    }
    
    typealias C = ViewConstants.SignalView
}

extension ViewConstants
{
    struct SignalView
    {
        static let graphFrameHeight : CGFloat = 200
    }
}

//struct SignalView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignalView()
//    }
//}
