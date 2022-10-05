//
//  ScanCoordinator.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation
import VisionKit

extension ECGAppManager: VNDocumentCameraViewControllerDelegate
{
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan)
    {
        print("parsing")
        self.parseScan(scan)
        self.showSheet = false
    }
     
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController)
    {
        print("cancel")
    }
     
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error)
    {
        print("ERROR: \(error)")
    }
}

extension ECGAppManager
{
    func parseScan(_ rawScans: VNDocumentCameraScan)
    {
        var scans : Array<ECGScan> = []
        
        queue.async
        {
            let images = (0..<rawScans.pageCount).compactMap
            {
                rawScans.imageOfPage(at: $0).cgImage
            }
            
            scans = images.map
            {
                ECGScan(personalInfo: .standard, image: $0, cropPoint: CropPoint.zero)
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
                self.addScans(scans)
            }
        }
    }
}
