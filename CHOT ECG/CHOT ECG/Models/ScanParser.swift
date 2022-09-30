//
//  ScanParser.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import Foundation
import VisionKit
import Vision


final class ScanParser
{
    
    let cameraScan: VNDocumentCameraScan
    
    init(cameraScan:VNDocumentCameraScan)
    {
        self.cameraScan = cameraScan
        
    }
    
    private let queue = DispatchQueue(label: "scan-codes", qos: .default, attributes: [], autoreleaseFrequency: .workItem)
    
    /// I kinda want to take this queue out and make it an input so
    /// that this whole class could be make a struct, and this
    /// function could be made static. It definitly isn't needed now,
    /// but will likely be needed once we start using text recognition
    /// again for the personal info
    func parseScan(withCompletionHandler completionHandler: @escaping ([ECGScan]) -> Void)
    {
        var scans : Array<ECGScan> = []
        
        queue.async
        {
            let images = (0..<self.cameraScan.pageCount).compactMap
            {
                self.cameraScan.imageOfPage(at: $0).cgImage
            }
            
            scans = images.map
            {
                ECGScan(personalInfo: .standard, image: $0)
            }
            
            
//            // For getting text out of images, will need to look into this for personal and scan info
//            let imagesAndRequests = images.map
//            {
//                (image: $0, request:VNRecognizeTextRequest())
//            }
//
//            let textPerPage = imagesAndRequests.map
//            {
//                image,request->String in
//
//                let handler = VNImageRequestHandler(cgImage: image, options: [:])
//
//                do
//                {
//                    try handler.perform([request])
//
//                    guard let observations = request.results as? [VNRecognizedTextObservation] else{return ""}
//
//                    return observations.compactMap({$0.topCandidates(1).first?.string}).joined(separator: "\n")
//                }
//                catch
//                {
//                    print(error)
//                    return ""
//                }
//            }
//

            DispatchQueue.main.async
            {
                completionHandler(scans)
            }
        }
        
    }
}
