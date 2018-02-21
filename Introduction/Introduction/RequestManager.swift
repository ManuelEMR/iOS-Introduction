//
//  RequestManager.swift
//  Introduction
//
//  Created by Manuel Munoz on 2/8/18.
//  Copyright © 2018 Manuel Munoz. All rights reserved.
//

import Foundation

class RequestManager {
    
    private let session: URLSession = URLSession(configuration: .default)
    
    func requestPublicGithubRepos(completionHandler: @escaping ((Data) -> Void)) {
        
        guard let urlComponent = URLComponents(string: "https://api.github.com/repositories"),
        let url = urlComponent.url else {
            print("Invalid url")
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error requesting repos \(error)")
                return
            }
            
            guard let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                print("Data response is null")
                return
            }
            
            completionHandler(data)
        }
        dataTask.resume()
    }
}
