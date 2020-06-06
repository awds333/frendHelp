//
//  ViewController.swift
//  Task2.2
//
//  Created by Pavel Bandiuk on 22.05.2020.
//  Copyright © 2020 Pavel Bandiuk. All rights reserved.
//

import UIKit
import MapKit

final class MuseumAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    
    init(coordinate: CLLocationCoordinate2D, title:String?, subtitle:String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
        super.init()
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        
        
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        let loc = sender.location(in: self.view)
        let lc = mapView.convert(loc, toCoordinateFrom: self.mapView)
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let mitCoordinate = CLLocationCoordinate2D(latitude: lc.latitude, longitude: lc.longitude)
        let location = CLLocation(latitude: lc.latitude, longitude: lc.longitude)
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks![0] as! CLPlacemark
            let mitAnnotation = MuseumAnnotation(coordinate: mitCoordinate, title: pm.locality, subtitle: "")
            self.mapView.addAnnotation(mitAnnotation)
            self.navigationItem.title = pm.locality
        })
    
    }
    
    
    func addAnnotation(title: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let annoation = MKPointAnnotation()
        annoation.title = title
        annoation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.addAnnotation(annoation)
    }
    
    
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let museumAnnotation = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier) as? MKMarkerAnnotationView {
            museumAnnotation.animatesWhenAdded = true
            museumAnnotation.titleVisibility = .adaptive
            
            return museumAnnotation
        }
        
        return nil
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "resultV") as! ResultController
        vc.title_send = self.navigationItem.title
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

