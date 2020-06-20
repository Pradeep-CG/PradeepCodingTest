//
//  HttpUtility.swift
//  PradeepCodingTest
//
//  Created by Pradeep on 21/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation
import UIKit

struct HttpUtility{
    
    func getApiData<T:Decodable>(requestUrl:String,resultType: T.Type, completionHandler:@escaping(_ result:T) -> Void) {
        
        
        if Common.verifyUrl(urlString: requestUrl) {
            
            let requestApiUrl = URL(string: requestUrl)!
            URLSession.shared.dataTask(with: requestApiUrl) { (responseData, httpUrlResponse, error) in
                
                if(error == nil && httpUrlResponse != nil && responseData?.count != 0){
                    
                    let dataString = String(decoding: responseData!, as: UTF8.self)
                    let jsonData = dataString.data(using: .utf8)!
                    
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(T.self, from: jsonData)
                        _=completionHandler(result)
                        
                    } catch let error {
                        debugPrint("error occured while decoding = \(error.localizedDescription)")
                    }
                }
            }
            .resume()
        }
    }
}

