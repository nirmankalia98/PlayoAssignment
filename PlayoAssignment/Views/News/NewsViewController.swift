//
//  ViewController.swift
//  PlayoAssignment
//
//  Created by Mac Nirman on 5/14/22.
//

import UIKit

class NewsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.shared.fetchData(type: Result.self, url: URL(string: Constants.baseUrl + Constants.apiKey)!){res in
            print(res.debugDescription)
            
        }
    }


}

