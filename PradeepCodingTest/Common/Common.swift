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
    
    static func scaleUIImageToSize(image: UIImage) -> UIImage {
        let hasAlpha = false
        let size:CGSize = CGSize(width: 90, height: 70)
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.draw(in: CGRect(origin: .zero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
}
