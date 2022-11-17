//
//  ECGAppManager.swift
//  CHOT ECG
//
//  Created by Kevin Kelly on 9/22/22.
//

import Foundation

class ECGAppManager : NSObject, ObservableObject
{
    @Published var model : ECGApp //= ECGApp(scans: [])
    @Published var showSheet : Bool = false
    @Published var cropPoints : [CropPoint]
    @Published var path : [MainMenuOptions] = []
    
    // Need to look into more details about how queues work to see if this is the best fit
    // for our application
    let queue = DispatchQueue(
        label: "scan-codes",
        qos: .default,
        attributes: [],
        autoreleaseFrequency: .workItem
    )
    
    override init()
    {
        model = ECGApp(scans: [])
        cropPoints = ECGAppManager.initCropPoints()

        super.init()
    }
    
    /// When the scan completes, we send it to the server, but before that we need
    /// to get get the coordinates of the crops
    func addScans(_ scans: [ECGScan]?)
    {
        self.model.addScans(scans)
    }
    
    
    func sendImageData(data: Data)
    {
        let URLsession = URLSession.shared
        let url = URL(string: "https://chotbackend.herokuapp.com/api/ecg-in/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
        
//        let path = self.getDocumentsDirectory().appendingPathExtension("image.png")
//        print(path.absoluteString)
//        request.setValue(path.lastPathComponent, forHTTPHeaderField: "image_url")
//        print(path.lastPathComponent)
//
//        let task = URLsession.uploadTask(with: request, fromFile: path) { data, response, error in
//
//            guard error == nil else {print("ERROR: \(error)"); return}
//
////            print ("RESPOSNE: \(response)")
//
////            guard let response = response as? HTTPURLResponse,
////                  (200...299).contains(response.statusCode) else {
////                return
////            }
//
////            print(data)
////            print(data! as NSData)
//            print(String(decoding: data!, as: UTF8.self))
//        }

        let key = "img_base64=".data(using: .utf8)

        let send = (key! + data.base64EncodedData())


        let task = URLsession.uploadTask(with: request, from: send) { data, response, error in

            guard error == nil else {print("ERROR: \(error)"); return}

            print ("RESPOSNE: \(response)")

//            guard let response = response as? HTTPURLResponse,
//                  (200...299).contains(response.statusCode) else {
//                return
//            }

            print(data)
            print(data! as NSData)
            print(String(decoding: data!, as: UTF8.self))

        }
        
        task.resume()
    }
    
}



