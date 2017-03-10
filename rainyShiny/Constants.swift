//
//  Constants.swift
//  rainyShiny
//
//  Created by oatThanut on 3/8/2560 BE.
//  Copyright © 2560 oatThanut. All rights reserved.
//

import Foundation

let BASE_CURRENT_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "fdeefc34c408f1063a85c51d09c7899d"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_CURRENT_URL)\(LATITUDE)\(Location.shareInstance.latitude!)\(LONGTITUDE)\(Location.shareInstance.longtitude!)\(APP_ID)\(API_KEY)"


let BASE_FORCAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let NUMBER_OF_DAY = "&cnt="
let FORCAST_URL = "\(BASE_FORCAST_URL)\(LATITUDE)\(Location.shareInstance.latitude!)\(LONGTITUDE)\(Location.shareInstance.longtitude!)\(NUMBER_OF_DAY)7\(APP_ID)\(API_KEY)"
