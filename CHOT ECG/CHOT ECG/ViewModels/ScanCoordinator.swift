//
//  ScanCoordinator.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation
import VisionKit

final class ScanCoordinator: NSObject, VNDocumentCameraViewControllerDelegate
{
    private let completionHandler: (Array<ECGScan>) -> Void

    init(completion: @escaping (Array<ECGScan>) -> Void)
    {
        self.completionHandler = completion
    }
     
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan)
    {
        let parser = ScanParser(cameraScan: scan)
        parser.parseScan()
        //completionHandler(scan)
    }
     
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController)
    {
        //completionHandler(nil)
    }
     
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error)
    {
        //print(error)
        //completionHandler(nil)
    }
}
