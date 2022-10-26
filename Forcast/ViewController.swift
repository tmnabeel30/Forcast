//
//  ViewController.swift
//  Forcast
//
//  Created by Nabeel on 19/08/20.
//  Copyright © 2020 Nabeel. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    private var location:CLLocationManager!
    private var lat = ""
    private var long = ""
    var Object = ForcastData()
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        
        Object.changedURL(lat: lat, long: long)
        // Do any additional setup after loading the view

    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            lat  = String(location.coordinate.latitude)
            long = String(location.coordinate.longitude)
          
           
        }
   
    }

    func getLocation() {
        location = CLLocationManager()
        location.requestWhenInUseAuthorization()
        location.startUpdatingLocation()
        location.delegate = self
        
        
        
    }
    @IBAction func fetchLocation(_ sender: Any) {
        print(lat,long)
        Object.changedURL(lat: lat, long: long)
        print(Object.weatherURL)

    }
    
}

