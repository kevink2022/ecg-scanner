//
//  ECGDigitalSignal.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import Foundation

/// This will be the 12-lead signals after being converted to digital data
struct ECGSignal
{
    let I   : Data
    let II  : Data
    let III : Data
    let aVR : Data
    let aVL : Data
    let aVF : Data
    let V1  : Data
    let V2  : Data
    let V3  : Data
    let V4  : Data
    let V5  : Data
    let V6  : Data
}
