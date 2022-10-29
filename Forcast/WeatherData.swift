//
//  WeatherData.swift
//  Forcast
//
//  Created by Nabeel on 28/10/22.
//  Copyright © 2022 Nabeel. All rights reserved.
//

import Foundation

struct weather_data:Decodable {
    var current_weather : current_weather

}

struct current_weather:Decodable {
    var temperature : Double
}





struct GeoData:Decodable {
    var longt : String
    var latt : String
}


