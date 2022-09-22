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
//    private let completionHandler: (DevConstants.CompletionReturnValue?) -> Void
//
//    init(completion: @escaping (DevConstants.CompletionReturnValue?) -> Void)
//    {
//        self.completionHandler = completion
//    }
     
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: DevConstants.CompletionReturnValue)
    {
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

struct DevConstants
{
    typealias CompletionReturnValue = [ECGScan]
}
