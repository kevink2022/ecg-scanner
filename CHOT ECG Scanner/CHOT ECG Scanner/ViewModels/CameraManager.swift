//
//  CameraManager.swift
//  CHOT ECG Scanner
//
//  Created by Kevin Kelly on 9/8/22.
//

import Foundation
import AVFoundation
import SwiftUI
import VisionKit

class CameraManager: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate
{
    
    // Not sure what exactly needs to be published yet
    @Published var session = AVCaptureSession()
    
    var output = AVCapturePhotoOutput()
    
    var preview = AVCaptureVideoPreviewLayer()
    
    @Published var photoTaken = false
    
    var photoData = Data(count: 0)
    
    var scanningDocVS = VNDocumentCameraViewController()
    
}


extension CameraManager
{
    func initializeDocScan()
    {
        self.scanningDocVS.delegate
    }
    
    func initializeCamera()
    {
        do
        {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            
            // MARK: FIX ME
            // Shouldn't force unwrap unless initialization of device throws error when returning nil
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input)
            {
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output)
            {
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        }
        catch
        {
            print(error)
        }
    }
    
    
    func capturePhoto()
    {
        DispatchQueue.global(qos: .background).async
        {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            
            self.session.stopRunning()
            
            DispatchQueue.main.async
            {
                // Toggle the photo taken status
                withAnimation
                {
                    self.photoTaken.toggle()
                }
            }
        }
    }
    
    func resetCamera()
    {
        DispatchQueue.global(qos: .background).async
        {
            self.session.startRunning()
            
            DispatchQueue.main.async
            {
                // Toggle the photo taken status
                withAnimation
                {
                    self.photoTaken.toggle()
                }
            }
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?)
    {
        if (error != nil)
        {
            print(error!)
            return
        }
        
        guard let imageData = photo.fileDataRepresentation()
        else {
            print("bad news")
            return
            
        }
        
        print("saving image data")
        self.photoData = imageData
    }
    
    func savePhoto()
    {        
        // Force unwrap here is bad
        if let image = UIImage(data: self.photoData)
        {
            // Probably not going save into an album, but probably save as a file in Files app
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    
    
    func checkPermissions ()
    {
        // Checking for video so we can have a live preview
        switch AVCaptureDevice.authorizationStatus(for: .video)
        {
        case.authorized:
            initializeCamera()
            return
            
        case.notDetermined:
            // request permission
            AVCaptureDevice.requestAccess(for: .video)
            {
                status in
                
                if status
                {
                    self.initializeCamera()
                }
                
            }
            return
            
        case.restricted:
            // message asking for permission
            return
            
        case.denied:
            // message asking for permission
            return
            
        default:
            return
        }
    }
}
