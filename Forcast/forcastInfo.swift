//
//  forcastInfo.swift
//  Forcast
//
//  Created by Nabeel on 26/10/22.
//  Copyright © 2022 Nabeel. All rights reserved.
//
//To perform Request we have 4 steps below
import Foundation
struct ForcastData {
    var weatherURL = "https://api.open-meteo.com/v1/forecast?latitude=37.785834&longitude=-122.406417&&current_weather=true&&timezone=auto"
    mutating func changedURL(lat: String, long:String){
      //1. edditing url lat and long
        let finalURL = "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(long)&&current_weather=true&&timezone=auto"
       weatherURL = finalURL
    }
    
}

func performRequest(){
   //step 1. creating url
    let url = URL(string: ForcastData().weatherURL)
    //Step 2. Create A url session
    let session = URLSession(configuration: .default)
    //Step 3. using data task to retrieve info
    let task = session.dataTask(with: url!, completionHandler: handle(data:urlrespose:errror:))
        
    task.resume()
    //Completion Handler Function
    func handle(data:Data?, urlrespose:URLResponse?, errror:Error?){
        if errror != nil{
            print(errror!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
    }
   
       
        }
//        guard let httpResponse = response as? HTTPURLResponse,
//                    (200...299).contains(httpResponse.statusCode) else {
//                  print(error)
//                    return
//
//    }
//        if let safedata = data{
//            let safestring = String(data: safedata, encoding: .utf8)
//
//        }

}



//private func readLocalData(forName name: String) -> Data? {
//    do{
//        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"){
//            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
//            return jsonData
//
//        }
//    }catch{
//        print(error)
//    }
//    return nil
//}
//
//private func parse(jsonData: Data) {
//    do {
//        let decodedData = try JSONDecoder().decode(ForcastData.self,
//                                                   from: jsonData)
//
//        print("Title: ", decodedData.title)
//        print("Description: ", decodedData.description)
//        print("===================================")
//    } catch {
//        print("decode error")
//    }
//}
//
//
//
//private func loadJson(fromURLString urlString: String,
//                      completion: @escaping (Result<Data, Error>) -> Void) {
//    if let url = URL(string: urlString) {
//        let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//            }
//
//            if let data = data {
//                completion(.success(data))
//            }
//        }
//
//        urlSession.resume()
//    }

