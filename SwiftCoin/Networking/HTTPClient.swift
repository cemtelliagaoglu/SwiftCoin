//
//  HTTPClient.swift
//  SwiftCoin
//
//  Created by admin on 25.07.2023.
//

import Foundation

public protocol HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type,
        completion: @escaping (Result<T, RequestError>) -> Void
    )
}

public extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type,
        completion: @escaping (Result<T, RequestError>) -> Void
    ) {
        let urlComponents = prepareURLComponents(with: endpoint)

        guard let url = urlComponents.url else {
            return completion(.failure(.invalidURL))
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        URLSession.shared.dataTask(with: request) { data, response, _ in

            do {
                guard let response = response as? HTTPURLResponse else {
                    return completion(.failure(.noResponse))
                }

                switch response.statusCode {
                case 200 ... 299:
                    guard let data else { return }
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return completion(.success(decodedResponse))
                case 401:
                    return completion(.failure(.unauthorized))
                case 429:
                    return completion(.failure(.rateLimit))
                default:
                    return completion(.failure(.unexpectedStatusCode))
                }
            } catch {
                return completion(.failure(.decode))
            }
        }
        .resume()
    }

    private func prepareURLComponents(
        with endpoint: Endpoint
    ) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        if let queryItems = endpoint.queryItems {
            urlComponents.queryItems = queryItems
        }

        return urlComponents
    }
}
