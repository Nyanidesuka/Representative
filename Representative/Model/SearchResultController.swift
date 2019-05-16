//
//  SearchResultController.swift
//  Representative
//
//  Created by Haley Jones on 5/16/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation
class SearchResultController{
    
    static let baseURL = URL(string: "https://whoismyrepresentative.com/getall_reps_bystate.php")
    
    //CRUD
    static func fetchReps(searchTerm: String, completion: @escaping ([Representative]) -> Void){
        guard let url = baseURL else {completion([]); return}
        //i wanna build up the query item now
        let stateQuery = URLQueryItem(name: "state", value: searchTerm)
        //and we need this to get it to hand me json
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [stateQuery, jsonQuery]
        
        guard let finalURL = components?.url else {completion([]); return}
        print(finalURL)
        //woo we got a URL now we need to actually use it ok lets go
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            //if theres an error, report it and dip
            if let error = error{
                print("There was an error fetching the data. \(error.localizedDescription)")
                completion([])
                return
            }
            //now that we know we have no error let's unwrap that data
            //do some nutty conversion chain here because this api hands back ASCII encoding
            guard let data = data, let dataString = String(data: data, encoding: .ascii), let newData = dataString.data(using: .utf8) else {completion([]); return}
            //and now that we have data, and it is unwrapped, lets try and decode that boi
            do{
                let TLD = try JSONDecoder().decode(SearchResult.self, from: newData)
                let reps = TLD.results
                completion(reps)
            } catch {
                print("There was an error unwrapping the fetched data. \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
}
