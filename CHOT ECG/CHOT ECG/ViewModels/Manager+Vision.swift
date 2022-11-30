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
            let images = (0..<rawScans.pageCount).compactMap
            {
                rawScans.imageOfPage(at: $0).cgImage
            }
            
            let imageData = (0..<rawScans.pageCount).compactMap
            {
                if let data = rawScans.imageOfPage(at: $0).pngData() {
//                    let filename = self.getDocumentsDirectory().appendingPathComponent("copy.png")
//                    do {try data.write(to: filename)} catch {print("couldn't save image")}
//                    print(filename)
//                    return filename
                    return data
                }
                
                return nil
            }
            
//            imageData.forEach
//            {
//                let filename = self.getDocumentsDirectory().appendingPathComponent("image.png")
//                do {try $0.write(to: filename)}
//                catch {print("file wrtie failed")}
//            }
//
//
//
//            imageData.forEach {self.sendImageData(data: $0)}
            
            let send = imageData.map { _ in SendData(img_binary: "test_Data".data(using: .utf8)!) }
            
            let encoder = JSONEncoder()

            let encoded = send.compactMap
            {
                do
                {
                    let json = try encoder.encode($0)
                    return json
                }
                catch
                {
                    print("%%%%%%%%%%%%%%%%%%% ENCODING ERROR %%%%%%%%%%%%%%%%%%%")
                    return Data()
                }
            }
            
            //encoded.forEach { data in self.sendImageData(data: data) }
            imageData.forEach { data in self.sendImageData(data: data) }
            //imageData.forEach { _ in self.sendImageData(data: "test_Data".data(using: .utf8)!) }
            
            scans = images.map
            {
                ECGScan(personalInfo: .standard, image: $0)
            }
            
            // For getting text out of images, will need to look into this for personal and scan info
            let imagesAndRequests = images.map
            {
                (image: $0, request:VNRecognizeTextRequest())
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
                    
                    //print(text)
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


struct SendData : Codable
{
    let img_binary : Data
    
    
    enum CodingKeys : String, CodingKey
    {
        case img_binary = "img_binary"
    }
}
