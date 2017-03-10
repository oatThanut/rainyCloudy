//
//  WeatherVC.swift
//  rainyShiny
//
//  Created by oatThanut on 3/8/2560 BE.
//  Copyright © 2560 oatThanut. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherTypeLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let locationManaegr = CLLocationManager()
    var currentLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forcast: Forcast!
    var forcasts = [Forcast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManaegr.delegate = self
        locationManaegr.desiredAccuracy = kCLLocationAccuracyBest
        locationManaegr.requestWhenInUseAuthorization()
        locationManaegr.stopMonitoringSignificantLocationChanges()
        
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather = CurrentWeather()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManaegr.location
            Location.shareInstance.latitude = currentLocation.coordinate.latitude
            Location.shareInstance.longtitude = currentLocation.coordinate.longitude
            
            print("\(Location.shareInstance.latitude)  <,>  \(Location.shareInstance.longtitude)")
            
            currentWeather.downloadWeatherDetails {
                // Setup UI to load downloaded data
                self.downloadForcastData {
                    self.updateMainUI()
                }
            }
        } else {
            locationManaegr.requestWhenInUseAuthorization()
            locationAuthStatus() 
        }
        
    }
    
    func downloadForcastData(completed: @escaping DownloadComplete) {
        let forcastURL = URL(string: FORCAST_URL)!
        Alamofire.request(forcastURL).responseJSON { responds in
            let result = responds.result
            
            if let dict = result.value as? Dictionary<String, Any>{
                if let list = dict["list"] as? [Dictionary<String, Any>] {
                    for obj in list {
                        let forcast = Forcast(weatherDict: obj)
                        self.forcasts.append(forcast)
                        
                    }
                    self.forcasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forcasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
        
            let forcast = forcasts[indexPath.row]
            cell.configureCell(forcast: forcast)
            return cell
        } else {
            return WeatherCell()
        }
        
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLbl.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherIcon.image = UIImage(named: currentWeather.weatherType)
    }
    
    
}

 
