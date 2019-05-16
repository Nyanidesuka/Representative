//
//  SearchResult.swift
//  Representative
//
//  Created by Haley Jones on 5/16/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

struct SearchResult: Decodable{
    let results: [Representative]
}

struct Representative: Decodable{
    let name: String?
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    //everything in the API is intuitively named, so we dont need coding keys
    
}
