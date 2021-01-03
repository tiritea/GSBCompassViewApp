//
//  ViewController.swift
//  GSBCompassViewApp
//
//  Created by Gareth Bestor on 4/01/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let compassView = GSBCompassView()
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.headingAvailable()) {
            view.addSubview(compassView)
            compassView.frame = view.bounds
            compassView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            // Start updating compass...
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        compassView.compassDegress = -heading.magneticHeading
        compassView.setNeedsDisplay()
    }
}

