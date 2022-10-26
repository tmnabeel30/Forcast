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
      //1. Create a Url
        let finalURL = "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(long)&&current_weather=true&&timezone=auto"
       weatherURL = finalURL
    }
    
}

func performRequest(){
    
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
//}
