//
//  ApiClient.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import Foundation



final class ApiClient {
    
    // MARK: - Properties
    
    private let session: URLSession = .shared
    private let baseUrl: String = Constants.baseUrl
    static let shared: ApiClient = .init()
    
    // MARK: - Methods
    
    func getData<Object: Decodable>(for route: Route, as type: Object.Type, completion: @escaping (Object) -> Void) {
        guard let url = URL(string: baseUrl + route.path) else { return }
        
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let object = try? decoder.decode(Object.self, from: data) {
                    completion(object)
                }
            }
        }
        task.resume()
    }
}

    //MARK: - Extensions

extension ApiClient {
    enum Constants {
        static let locationQuery: String = "/location/search/?query="
        static let locationCityId: String = "/location/"
        static let baseUrl: String = "https://www.metaweather.com/api"
    }
    
    enum Route {
        case city(String)
        case weather(String)
        
        var path: String {
            switch self {
            case .city(let query):
                return Constants.locationQuery + query
            case .weather(let cityId):
                return Constants.locationCityId + cityId
            }
        }
    }
}
