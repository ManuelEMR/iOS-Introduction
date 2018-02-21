//
//  GitHubrepo.swift
//  Introduction
//
//  Created by Manuel Munoz on 2/8/18.
//  Copyright © 2018 Manuel Munoz. All rights reserved.
//

import Foundation

class GitHubRepo {

    let name: String
    let fullName: String
    
    init(json dict: [String: Any]) {
        
        name = dict["name"] as? String ?? ""
        fullName = dict["full_name"] as? String ?? ""
    }
}
