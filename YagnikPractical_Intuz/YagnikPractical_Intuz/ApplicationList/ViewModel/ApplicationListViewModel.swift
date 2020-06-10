//
//  ApplicationListViewModel.swift
//  
//
//  Created by Yagnik Suthar on 10/06/20.
//

import Foundation
class ApplicationListViewModel {
    
    var arrApps = [Results]()

    func getDataFromWeb(completion :@escaping (Bool) -> ()) {
        WebService.callAPIWith(completion: { result in
            self.arrApps = result.map({Results($0 as! [String : Any])})
            print(self.arrApps)
            completion(true)
        })
    }
}
