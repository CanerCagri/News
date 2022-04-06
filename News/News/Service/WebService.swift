//
//  WebService.swift
//  News
//
//  Created by Caner Çağrı on 6.04.2022.
//
import Foundation

struct WebService {
    
    func takeNews(url: URL , completion: @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                
                if let newsArrays = newsArray {
                    completion(newsArrays)
                }
            }
        }.resume()
    }
}
