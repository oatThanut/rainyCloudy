//
//  Constants.swift
//  rainyShiny
//
//  Created by oatThanut on 3/8/2560 BE.
//  Copyright © 2560 oatThanut. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "fdeefc34c408f1063a85c51d09c7899d"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)36\(LONGTITUDE)123\(APP_ID)\(API_KEY)"


