//
//  Weather.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-12-07.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    
    var temp: Double?
    var humidity: Double?
    
}
