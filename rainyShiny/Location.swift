//
//  Location.swift
//  rainyShiny
//
//  Created by oatThanut on 3/10/2560 BE.
//  Copyright © 2560 oatThanut. All rights reserved.
//

import CoreLocation

class Location {
    static var shareInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longtitude: Double!
}
