//
//  ECGScanner+Vision.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation
import VisionKit

extension ECGScanner
{
    func parseScan(_ scan: VNDocumentCameraScan) -> Array<ECGScan>
    {
        //        queue.async
        //        {
        let images = (0..<scan.pageCount).compactMap
        {
            scan.imageOfPage(at: $0).cgImage
        }
        
        let ECGScans = images.map
        {
            ECGScan(personalInfo: .standard, image: $0)
        }
        //        }
        
        return ECGScans
    }
}
