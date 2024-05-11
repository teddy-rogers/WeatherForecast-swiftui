//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Teddy on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Mon", high: 28, low: 12, weather: "rainy")
            DayForecast(day: "Tue", high: 24, low: 8, weather: "sunny")
            DayForecast(day: "Tue", high: 24, low: 8, weather: "foo")
        }
    }
}

#Preview {
    ContentView()
}

typealias WeatherValue = (iconName:String, color: Color)

enum Weather: String {
    case sunny, rainy, cloudy, snowy, windy, NA
    var value: WeatherValue {
        switch self {
        case .sunny: return ("sun.max.fill", .yellow)
        case .rainy: return ("cloud.rain.fill", .blue)
        case .cloudy: return ("cloud.fill", .gray)
        case .snowy: return ("snowflake", .cyan)
        case .windy: return ("wind.snow", .gray)
        case .NA: return ("exclamationmark.circle", .red)
        }
    }
}

struct DayForecast: View {
    let day: String
    let high: Int
    let low: Int
    let weather: String

    func getWeatherValue(_ weather: String) -> WeatherValue {
        return  Weather(rawValue: weather)?.value ?? Weather.NA.value
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: getWeatherValue(weather).iconName)
                .foregroundStyle(getWeatherValue(weather).color)
                .font(Font.largeTitle)
                .padding()
            Text("High: \(high)°")
                .fontWeight(.semibold)
            Text("Low: \(low)°")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
