//
//  WebServiceCall.swift
//  YagnikPractical
//
//  Created by Yagnik Suthar on 22/11/18.
//  Copyright © 2018 Yagnik Suthar. All rights reserved.
//

import Foundation

class WebService {
    
    static func callAPIWith(completion :@escaping ([Any]) -> ()) {
        
        let url : String = "https://itunes.apple.com/search?term=vitebsolutionspvtltd&entity=software"
        let requestUrl = URL(string: url)
        var request : URLRequest = URLRequest(url: requestUrl!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, _, _ in
            
            if let data = data {
                
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let data = json as? [String:Any] {
                    if let result = data["results"] as? [Any] {
                        DispatchQueue.main.async {
                            completion(result)
                        }
                    }
                }
                
            }
            
            }.resume()
        
    }
}
