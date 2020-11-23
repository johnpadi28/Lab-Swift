//
//  WeatherData.swift
//  API Project
//
//  Created by John Padilla on 11/23/20.
//

import Foundation

struct  WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
