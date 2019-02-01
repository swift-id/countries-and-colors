//
//  CountryDetailViewController.swift
//  Countries and Colors
//
//  Created by R. Kukuh on 01/02/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var selectedCountry: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let country = selectedCountry {
            self.title = country.name
            self.view.backgroundColor = country.color
        }
    }
}
