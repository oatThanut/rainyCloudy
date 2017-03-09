//
//  WeatherCell.swift
//  rainyShiny
//
//  Created by oatThanut on 3/9/2560 BE.
//  Copyright © 2560 oatThanut. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    
    func configureCell(forcast: Forcast) {
        lowTemp.text = String(forcast.lowTemp)
        highTemp.text = String(forcast.highTemp)
        weatherType.text = forcast.weatherType
        dayLabel.text = forcast.date
        weatherIcon.image = UIImage(named: forcast.weatherType)
    }
    
}
