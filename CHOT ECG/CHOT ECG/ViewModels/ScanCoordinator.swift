//
//  ScanCoordinator.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation
import VisionKit
//import SwiftUI

final class ScanCoordinator: NSObject, VNDocumentCameraViewControllerDelegate
{
    private let completionHandler: (Array<ECGScan>?) -> Void
    
    init(completion: @escaping (Array<ECGScan>?) -> Void)
    {
        self.completionHandler = completion
    }
     
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan)
    {
        print("parsing")
        let parser = ScanParser(cameraScan: scan)
        parser.parseScan(withCompletionHandler: completionHandler)
    }
     
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController)
    {
        print("cancel")
        completionHandler(nil)
    }
     
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error)
    {
        print("ERROR: \(error)")
        completionHandler(nil)
    }
}
