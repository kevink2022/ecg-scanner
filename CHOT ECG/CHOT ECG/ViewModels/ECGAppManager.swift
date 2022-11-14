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
        //request.setValue("file", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLsession.uploadTask(with: request, from: data) { data, response, error in
            
            guard error == nil else {print("ERROR: \(error)"); return}

            print ("RESPOSNE: \(response)")

            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                return
            }

            print(data)
        }
        
        task.resume()
    }
    
}



