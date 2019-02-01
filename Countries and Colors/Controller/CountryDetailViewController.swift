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
        
        if let countryName = selectedCountry?.name {
            self.title = countryName
        }
        
        if let countryColor = selectedCountry?.color {
            self.view.backgroundColor = countryColor
        }
    }
}
