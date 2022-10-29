//
//  forcastInfo.swift
//  Forcast
//
//  Created by Nabeel on 26/10/22.
//  Copyright © 2022 Nabeel. All rights reserved.
//
//To perform Request we have 4 steps below
import Foundation
var finalURL = ""
var finalURLforSeach = ""
var currentWeather = ""


struct ForcastData {
    var weatherURL = "https://api.open-meteo.com/v1/forecast?latitude=37.785834&longitude=-122.406417&&current_weather=true&&timezone=auto"
    mutating func changedURL(lat: String, long:String){
      //1. edditing url lat and long
         finalURL = "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(long)&&current_weather=true&&timezone=auto"
       weatherURL = finalURL
    }
    
}

func performRequest(){
   //step 1. creating url
    print(ForcastData().weatherURL)
    let url = URL(string: ForcastData().weatherURL)
    //Step 2. Create A url session
    let session = URLSession(configuration: .default)
    //Step 3. using data task to retrieve info
    let task = session.dataTask(with: url!, completionHandler: handle(data:urlrespose:errror:))
    
    var safeDatapass:Data
        
    task.resume()
    //Completion Handler Function
    func handle(data:Data?, urlrespose:URLResponse?, errror:Error?){
        if errror != nil{
            print(errror!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            JSONPrase(weatherData: safeData)
         

    }
   
       
        }


}

func performSearchRequest(){
   //step 1. creating url
    let url = URL(string: finalURLforSeach)
    //Step 2. Create A url session
    let session = URLSession(configuration: .default)
    //Step 3. using data task to retrieve info
    let task = session.dataTask(with: url!, completionHandler: handle(data:urlrespose:errror:))
    
    var safeDatapass:Data
        
    task.resume()
    //Completion Handler Function
    func handle(data:Data?, urlrespose:URLResponse?, errror:Error?){
        if errror != nil{
            print(errror!)
            return
        }
        if let safeData = data{
            let dataString = String(data: safeData, encoding: .utf8)
            JSONPrase(weatherData: safeData)
         

    }
   
       
        }


}


private func JSONPrase(weatherData:Data){
    let decoder = JSONDecoder()
    do{
        let decodedtemp  = try decoder.decode(weather_data.self, from: weatherData)
//        print(decodedtemp.current_weather.temperature)
        currentWeather = "\(decodedtemp.current_weather.temperature)"
        print(currentWeather)
        
        
        
        
    } catch{
        print(error)
    }
}

// Adding Geocoding api

var city = "Delhi"

func performGeocodingRequest(){
    
    var urlString = "https://geocode.xyz/\(city)?json=1&auth=114082848598439258103x123317"
    var URL = URL(string: urlString)
    
    let urlSession = URLSession(configuration: .default)
    let task = urlSession.dataTask(with: URL!, completionHandler: handler(data:urlResponse:error:))
    
    func handler(data:Data? , urlResponse:URLResponse?, error:Error?) {
        if error != nil{
            print(error)
        }
        if let safeData = data{
           GeoCodingJSON(geoCodingData: safeData)
            
        }
    }
    task.resume()
    
}


private func GeoCodingJSON(geoCodingData:Data){
    
    let decoder = JSONDecoder()
    
    do{
      

        let DecodedData = try decoder.decode(GeoData.self, from: geoCodingData)
//        print(DecodedData.latt,DecodedData.longt)
        var geoLatt = ""
        var geoLong = ""
        geoLatt = DecodedData.latt
        geoLong = DecodedData.longt
        var weatherURL2 = "https://api.open-meteo.com/v1/forecast?latitude=\(geoLatt)&longitude=\(geoLong)&&current_weather=true&&timezone=auto"
        finalURLforSeach = weatherURL2

   
        performSearchRequest()
//        performRequest()
//        print(geoLatt,geoLong)
    }catch{
        print(error)
    }
    
}
