//
//  ScanCoordinator.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation
import VisionKit
import Vision

extension ECGAppManager: VNDocumentCameraViewControllerDelegate
{
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan)
    {
        self.parseScan(scan)
        self.showSheet = false
        self.path.removeAll()

    }
     
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController)
    {
        self.path.removeAll()
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
            let imageDataCollection = (0..<rawScans.pageCount).compactMap
            {
                let image = rawScans.imageOfPage(at: $0).cgImage
                if let data = rawScans.imageOfPage(at: $0).jpegData(compressionQuality: 1.0)
                {
                    return ImageData(image: image!, data: data, id: self.getScanID())
                }
                else
                {
                    print("ERROR")
                    return nil
                }
            }
            
            scans = imageDataCollection.map
            {
                self.sendImageData(data: $0.data, id: $0.id)
                return ECGScan(personalInfo: .standard, image: $0.image, id: $0.id)
            }
            
//            let images = (0..<rawScans.pageCount).compactMap
//            {
//                rawScans.imageOfPage(at: $0).cgImage
//            }
//
//            let imageData = (0..<rawScans.pageCount).compactMap
//            {
//                if let data = rawScans.imageOfPage(at: $0).jpegData(compressionQuality: 1.0)
//                {
//                    return data
//                }
//                else
//                {
//                    return nil
//                }
//            }
//
//
//            imageData.forEach { data in self.sendImageData(data: data, i) }
//
//            scans = images.map
//            {
//                ECGScan(personalInfo: .standard, image: $0, id: self.getScanID())
//            }
            
            // For getting text out of images, will need to look into this for personal and scan info
            let imagesAndRequests = imageDataCollection.map
            {
                (image: $0.image, request:VNRecognizeTextRequest())
            }

            let textPerPage = imagesAndRequests.map
            {
                image,request->String in

                let handler = VNImageRequestHandler(cgImage: image, options: [:])

                do
                {
                    try handler.perform([request])

                    guard let observations = request.results as? [VNRecognizedTextObservation]
                    else {print("OCR ERROR: nil"); return ""}

                    let text = observations.compactMap({$0.topCandidates(1).first?.string}).joined(separator: "\n") + "\n==================== END OF SCAN ===================="
                    
                    return text
                }
                catch
                {
                    print("OCR ERROR: \(error)")
                    return ""
                }
            }
            
            DispatchQueue.main.async
            {
                self.addScans(scans)
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


struct ImageData
{
    var image : CGImage
    var data : Data
    var id : Int
}
