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
    
    func downloadImage(urlString:String,index:IndexPath, completionHandler:@escaping (_ result:(String, UIImage, IndexPath)) -> Void) {
        
        let session = URLSession(configuration: .default)
        
        //creating a dataTask
        let getImageFromUrl = session.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            //if there is any error
            if let e = error {
                //displaying the message
                print("Error Occurred: \(e)")
                
            } else {
                //checking wheather the response is nil or not
                if (response as? HTTPURLResponse) != nil {
                    
                    //checking if the response contains an image
                    if let imageData = data {
                        
                        //getting the image
                        if let image = UIImage(data: imageData){
                          
                            completionHandler((urlString, image, index))
                        }
                        else{
                            let image = UIImage(named: "noImage")
                                                   completionHandler((urlString, image!, index))
                                                   print("Image file is currupted")
                        }
                    } else {
                        let image = UIImage(named: "noImage")
                        completionHandler((urlString, image!, index))
                        print("Image file is currupted")
                    }
                } else {
                    let image = UIImage(named: "noImage")
                    completionHandler((urlString, image!, index))
                    print("No response from server")
                }
            }
        }
        
        //starting the download task
        getImageFromUrl.resume()
    }
}

