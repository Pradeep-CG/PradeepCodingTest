//
//  CanadaViewController.swift
//  PradeepCodingTest
//
//  Created by Pradeep on 20/06/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import UIKit
import Foundation

class CanadaViewController: UIViewController {

    var httpUtility:HttpUtility?
    var canadaList:CanadaModel?
    var canadaTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        httpUtility = HttpUtility()
        
        loadViewComponents()
        retrieveDataFromApi()
    }
    
    func loadViewComponents() {
        
        self.view.addSubview(canadaTableView)
        
        //enable Auto Layout on contactsTableView by setting translatesAutoresizingMaskIntoConstraints to false
        canadaTableView.translatesAutoresizingMaskIntoConstraints = false
        canadaTableView.delegate = self
        canadaTableView.dataSource = self
        canadaTableView.register(CanadaTableViewCell.self, forCellReuseIdentifier: "canadaCell")
        canadaTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        canadaTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        canadaTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        canadaTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
        
    }
    func retrieveDataFromApi() {
        
        httpUtility?.getApiData(requestUrl: Common.apiString, resultType: CanadaModel.self, completionHandler: { (canadaResponse) in
                self.canadaList = canadaResponse
                //debugPrint("response = \(String(describing: self.canadaList))")
                print("title = \(self.canadaList?.title ?? "")")
                
                DispatchQueue.main.async {
                    
                    self.navigationItem.title = self.canadaList?.title
                    self.canadaTableView.reloadData()
                }
            })
    }
}

extension CanadaViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return canadaList?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "canadaCell", for: indexPath) as! CanadaTableViewCell
        
        if let rowDict = canadaList?.rows[indexPath.row]{
            cell.rowData = rowDict
        }
        return cell
    }
    
    
}
