//
//  CanadaViewController.swift
//  PradeepCodingTest
//
//  Created by Pradeep on 20/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit

class CanadaViewController: UIViewController {

    var httpUtility:HttpUtility?
    var canadaList:CanadaModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        httpUtility = HttpUtility()
        
        // Do any additional setup after loading the view.
        retrieveDataFromApi()
    }
    
    func retrieveDataFromApi() {
        
        httpUtility?.getApiData(requestUrl: Common.apiString, resultType: CanadaModel.self, completionHandler: { (canadaResponse) in
                self.canadaList = canadaResponse
                debugPrint("response = \(String(describing: self.canadaList))")
                print("title = \(self.canadaList?.title ?? "")")
                
                DispatchQueue.main.async {
                    
                    self.navigationItem.title = self.canadaList?.title
                    
                }
            })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
