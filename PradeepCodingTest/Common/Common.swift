//
//  Common.swift
//  PradeepCodingTest
//
//  Created by Pradeep on 21/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import Foundation
import UIKit

struct Common {
    
    static let apiString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    static func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
