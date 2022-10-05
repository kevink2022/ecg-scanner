//
//  ScannerView.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/21/22.
//

import VisionKit
import SwiftUI

struct ScannerView: UIViewControllerRepresentable
{
    private var coordinator : ECGAppManager
    
    init(coordinator: ECGAppManager)
    {
        self.coordinator = coordinator
    }
    
    // MARK: to Conform to Protocol
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> VNDocumentCameraViewController
    {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = self.coordinator
        return viewController
    }
     
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ScannerView>)
    {
        
    }
}

