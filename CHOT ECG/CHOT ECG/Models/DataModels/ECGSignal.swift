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
    let I   : [Double]
    let II  : [Double]
    let III : [Double]
    let aVR : [Double]
    let aVL : [Double]
    let aVF : [Double]
    let V1  : [Double]
    let V2  : [Double]
    let V3  : [Double]
    let V4  : [Double]
    let V5  : [Double]
    let V6  : [Double]


    enum CodingKeys : String, CodingKey
    {
        case I   = "0"
        case II  = "1"
        case III = "2"
        case aVR = "3"
        case aVL = "4"
        case aVF = "5"
        case V1  = "6"
        case V2  = "7"
        case V3  = "8"
        case V4  = "9"
        case V5  = "10"
        case V6  = "11"
    }

    var leads : [[Double]]

    {
        return [
            I,
            II,
            III,
            aVR,
            aVL,
            aVF,
            V1,
            V2,
            V3,
            V4,
            V5,
            V6
        ]
    }
}

extension ECGSignal : Decodable
{
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        I   = try values.decode([Double].self, forKey: .I)
        II  = try values.decode([Double].self, forKey: .II)
        III = try values.decode([Double].self, forKey: .III)
        aVR = try values.decode([Double].self, forKey: .aVR)
        aVL = try values.decode([Double].self, forKey: .aVL)
        aVF = try values.decode([Double].self, forKey: .aVF)
        V1  = try values.decode([Double].self, forKey: .V1)
        V2  = try values.decode([Double].self, forKey: .V2)
        V3  = try values.decode([Double].self, forKey: .V3)
        V4  = try values.decode([Double].self, forKey: .V4)
        V5  = try values.decode([Double].self, forKey: .V5)
        V6  = try values.decode([Double].self, forKey: .V6)

    }
}

extension Array where Element == Double
{
    mutating func trimZeros() -> [Double]
    {
        let startIndex = self.firstIndex(where: {$0 != 0.0})
        
        if let startIndex
        { self.removeFirst(startIndex) }
        
        let endIndex = self.lastIndex(where: {$0 != 0.0})
        
        if let endIndex
        { self.removeLast(endIndex) }
        
        return self
    }
}

//struct ECGSignal
//{
//    let I   : [Double?]
//    let II  : [Double?]
//    let III : [Double?]
//    let aVR : [Double?]
//    let aVL : [Double?]
//    let aVF : [Double?]
//    let V1  : [Double?]
//    let V2  : [Double?]
//    let V3  : [Double?]
//    let V4  : [Double?]
//    let V5  : [Double?]
//    let V6  : [Double?]
//
//
//    enum CodingKeys : String, CodingKey
//    {
//        case I   = "0"
//        case II  = "1"
//        case III = "2"
//        case aVR = "3"
//        case aVL = "4"
//        case aVF = "5"
//        case V1  = "6"
//        case V2  = "7"
//        case V3  = "8"
//        case V4  = "9"
//        case V5  = "10"
//        case V6  = "11"
//    }
//
//    var leads : [[Double?]]
//
//    {
//        return [
//            I,
//            II,
//            III,
//            aVR,
//            aVL,
//            aVF,
//            V1,
//            V2,
//            V3,
//            V4,
//            V5,
//            V6
//        ]
//    }
//}
//
//extension ECGSignal : Decodable
//{
//    init(from decoder : Decoder) throws
//    {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        I   = try values.decode([Double?].self, forKey: .I)
//        II  = try values.decode([Double?].self, forKey: .II)
//        III = try values.decode([Double?].self, forKey: .III)
//        aVR = try values.decode([Double?].self, forKey: .aVR)
//        aVL = try values.decode([Double?].self, forKey: .aVL)
//        aVF = try values.decode([Double?].self, forKey: .aVF)
//        V1  = try values.decode([Double?].self, forKey: .V1)
//        V2  = try values.decode([Double?].self, forKey: .V2)
//        V3  = try values.decode([Double?].self, forKey: .V3)
//        V4  = try values.decode([Double?].self, forKey: .V4)
//        V5  = try values.decode([Double?].self, forKey: .V5)
//        V6  = try values.decode([Double?].self, forKey: .V6)
//        arr = try values.decode([Double].self, forKey: .I  )
//        I   = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .II )
//        II  = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .III)
//        III = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .aVR)
//        aVR = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .aVL)
//        aVL = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .aVF)
//        aVF = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .V1 )
//        V1  = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .V2 )
//        V2  = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .V3 )
//        V3  = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .V4 )
//        V4  = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .V5 )
//        V5  = arr.trimZeros()
//        arr = try values.decode([Double].self, forKey: .V6 )
//        V6  = arr.trimZeros()
//    }
//}
