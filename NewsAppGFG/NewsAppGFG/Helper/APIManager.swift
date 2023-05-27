//
//  APIManager.swift
//  NewsAppGFG
//
//  Created by ROHIT DAS on 27/05/23.
//

import UIKit

enum DataError : Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}
typealias Handler = (Result<News,DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    private init(){}
    
    func fetchNews(completion : @escaping Handler) {
        guard let url = URL(string: Constant.API.newsURL) else{
            completion(.failure(.invalidData))
            return
            
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data ,error == nil else {return}
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let news = try JSONDecoder().decode(News.self, from: data)
                completion(.success(news))
            }
            catch{
                completion(.failure(.network(error)))
            }
        }.resume()
        
    }
}
