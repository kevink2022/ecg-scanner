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
    var scanID : Int = 0
    
    // Very lazy way of doing IDs
    func getScanID() -> Int
    {
        scanID += 1
        return scanID
    }
    
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
        
        let fullScan = Bundle.main.url(forResource: "fullScan", withExtension: "jpeg")
        let data = try! Data(contentsOf: fullScan!)
        sendImageData(data: data, id: -1)
        model.scans.append(ECGScan(personalInfo: .standard, id: -1))
        
    }
    
    /// When the scan completes, we send it to the server, but before that we need
    /// to get get the coordinates of the crops
    func addScans(_ scans: [ECGScan]?)
    {
        self.model.addScans(scans)
    }
    
    
    func sendImageData(data: Data, id: Int)
    {
        print("sending image")
        let URLsession = URLSession.shared
        let url = URL(string: "https://chotbackend.herokuapp.com/api/ecg-in/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"


        let key = "img_base64=data:imae/png;base64,".data(using: .utf8)
        
        let base = data.base64EncodedData().base64EncodedData()
        
        let send = (key! + base)
            

        let task = URLsession.uploadTask(with: request, from: send) { data, response, error in

            guard error == nil else {print("ERROR: \(error!.localizedDescription)"); return}

//            guard let response = response as? HTTPURLResponse,
//                  (200...299).contains(response.statusCode) else {
//                return
//            }

            print(response)
            print(String(decoding: data!, as: UTF8.self))
            
            DispatchQueue.main.async
            {
                self.addSignal(data: data!, id: id)
            }

        }
        
        task.resume()
    }
    
    func addSignal(data: Data, id: Int)
    {
        if let index = model.scans.firstIndex(where: {$0.id == id})
        {
            let decoder = JSONDecoder()

            do
            {
                let signal = try decoder.decode(ECGSignal.self, from: data)
                model.scans[index].signal = signal
            }
            catch
            {
                print("DECODING ERROR: \(error.localizedDescription)")
                
                do
                {
                    let dataAsString = String(decoding: data, as: UTF8.self)
                    let fixedString = dataAsString.replacing("NaN", with: "0.0")
                    if let fixedData = fixedString.data(using: .utf8)
                    {
                        let signal = try decoder.decode(ECGSignal.self, from: fixedData)
                        model.scans[index].signal = signal
                    }
                    else
                    {
                        print("ERROR: Couldn't fix data")
                    }
                }
                catch
                {
                    print("DECODING ERROR: \(error.localizedDescription)")
                }
            }
        }
    }
}



