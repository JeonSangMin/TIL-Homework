//
//  ViewController.swift
//  Homework_MapKit
//
//  Created by MyMac on 2020/01/09.
//  Copyright © 2020 sandMan. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    var placeName = ""
    var placeStreetAddress = ""
    
    // 좌표 저장
    var address: CLLocationCoordinate2D?
    //var current: CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        mapView.delegate = self
    }
    
    // 어노테이션 추가하기 좌표 = address
    func addAnnotation(add: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = self.placeName
        annotation.subtitle = self.placeStreetAddress
        //annotation.subtitle = "서울특별시"
        annotation.coordinate = add
        mapView.addAnnotation(annotation)
    }
}

//// MARK: - PolyLine
extension ViewController {
    
    // 사각형 그리기
    func addRectangle(coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        var point1 = center; point1.latitude += 0.01; point1.longitude -= 0.01
        var point2 = center; point2.latitude += 0.01; point2.longitude += 0.01
        var point3 = center; point3.latitude -= 0.007; point3.longitude += 0.01
        var point4 = center; point4.latitude -= 0.007 ; point4.longitude -= 0.01
        let points:[CLLocationCoordinate2D] = [point1, point2, point3, point4, point1]
        let polyLine = MKPolyline(coordinates: points, count: points.count)
        mapView.addOverlay(polyLine)
    }
    
    // 이동경로 그리기
    func route(destination: CLLocationCoordinate2D) {
        guard let source = address else { return }
        print(source)
        print(destination)
        let polyLine = MKPolyline(coordinates: [source, destination], count: 2)
        mapView.addOverlay(polyLine)
        address = source
    }
    
}

extension ViewController {
    // 지역 설정
    func setRegion(coordinate: CLLocationCoordinate2D) {
        // 폭. 지도상에서 얼마나 보여줄지 축척(?)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        // 지역설정
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        addAnnotation(add: coordinate)
        route(destination: coordinate)
        addRectangle(coordinate: coordinate)
    }
    
    // 주소 입력하면 위경도로 change
    func geocodeAddressString(_ addressString: String) {

        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placeMark, error) in
            
            if error != nil {
                return print(error!.localizedDescription)
            }
            guard let place = placeMark?.first else { return }
            
            self.placeName = place.name!
            self.placeStreetAddress = place.locality!
            
            self.setRegion(coordinate: place.location?.coordinate ?? CLLocationCoordinate2D())
            self.address = place.location?.coordinate
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // search에 텍스트 넣어주고 있으면 geocodeAddressString 실행하고, 없으면 return 
        guard let search = searchBar.text else { return }
        geocodeAddressString(search)
    }
    
}

// 폴리라인은 위에서 생성했으니 렌더링을 해줘야됨
extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyLine = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyLine)
            
            // 얘네를 안주면 화면에 표시가 안됨 - 색도 없고, 선 두께도 없으니깐
            renderer.strokeColor = .red
            renderer.lineWidth = 2
            
            return renderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}

