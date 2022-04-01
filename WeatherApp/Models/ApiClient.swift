//
//  ApiClient.swift
//  WeatherApp
//
//  Created by Paweł Kraszewski on 31/03/2022.
//

import Foundation

enum Route {
    case city(String)
    case weather(String)
    
    var path: String {
        switch self {
        case .city(let query):
            return "/location/search/?query=\(query)"
        case .weather(let cityId):
            return "/location/\(cityId)"
        }
    }
}

final class ApiClient {

    // MARK: - Properties
    
    private let session: URLSession = .shared
    private let baseUrl: String = "https://www.metaweather.com/api"
    static let shared: ApiClient = .init()
    
    // MARK: - Methods
    
    func getData<Object: Decodable>(for route: Route, as type: Object.Type, completion: @escaping (Object) -> Void) {
        guard let url = URL(string: baseUrl + route.path) else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        let testBody = "Test".data(using: .utf8)
//        request.httpBody = testBody
//        let task2 = session.dataTask(with: request) { <#Data?#>, <#URLResponse?#>, <#Error?#> in
//            <#code#>
//        }
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
