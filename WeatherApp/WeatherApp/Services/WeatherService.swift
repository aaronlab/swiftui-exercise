//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Aaron Lee on 2020-12-07.
//

import Foundation

final class WeatherService {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.lowercased())&appid=\(apiKey)&units=metric")
        else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
            
        }.resume()
        
    }
    
}
