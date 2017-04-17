//
//  StationSelectionViewController.swift
//  app
//
//  Created by Damir Garifullin on 15/04/2017.
//  Copyright © 2017 Damir Garifullin. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class StationSelectionViewController: UIViewController, GMSMapViewDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var stationInfo: UIView!
    @IBOutlet weak var constrait: NSLayoutConstraint!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    
    let gasStation: GMSMarker = GMSMarker()
    var gasStationSelected: GMSMarker?
    var listening = true
    
    override func viewDidLoad() {
        mapView.delegate = self
        mapView.bringSubview(toFront: stationInfo)
        //59.953204, 30.322013
        let camera = GMSCameraPosition.camera(withLatitude: 59.953204, longitude: 30.322013, zoom: 16.0)
        mapView.camera = camera
        
        createMarkers()
        stationInfo.alpha = 0
        constrait.constant = -200
        self.view.layoutIfNeeded()
        navigationBar.titleView = UIImageView(image: #imageLiteral(resourceName: "logo"))
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print(marker)
        gasStationSelected = gasStation
        self.listening = false
        showStationInfo()
        focusOnStation(marker)
        return true
    }
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        if gesture {
            animate()
        }
        
    }

    
    private func animate() {
        
        DispatchQueue.main.async {
            
            self.constrait.constant = -200
            UIView.animate(withDuration: 0.2, animations: {
                self.stationInfo.alpha = 0
                self.view.layoutIfNeeded()
            }, completion: { temp in
                print("yay")
            })
        }
    }
    @IBAction func closeButtonClicked(_ sender: Any) {
        animate()
    }
    private func showStationInfo() {
        constrait.constant = -49
        UIView.animate(withDuration: 0.2) {
            self.stationInfo.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    private func focusOnStation(_ station: GMSMarker) {
        let path = GMSMutablePath()
        path.add(station.position)
        path.add(CLLocationCoordinate2D(latitude: station.position.latitude - 0.005, longitude: station.position.longitude))
        let bounds = GMSCoordinateBounds(path: path)
        mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 100))
    }
    
    private func modifyPosition(position: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        var result = position
        result.latitude += 0.0004
        return result
    }
    
    private func createMarkers() {
        gasStation.position = CLLocationCoordinate2D(latitude: 59.953204, longitude: 30.322013)
        gasStation.map = mapView
        gasStation.isTappable = true
        gasStation.icon = #imageLiteral(resourceName: "pin_icon")
    
    }
    
    @IBAction func onButtonClicker(_ sender: Any) {
    }
    
    @IBAction func unwindToContainer(segue: UIStoryboardSegue) {
        
    }
}
