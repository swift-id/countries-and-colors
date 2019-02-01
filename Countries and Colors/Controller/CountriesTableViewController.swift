//
//  CountriesTableViewController.swift
//  Countries and Colors
//
//  Created by R. Kukuh on 01/02/19.
//  Copyright © 2019 R. Kukuh. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {
    
    var selectedCountry: Country?
    var continents: [Continent] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return continents.count
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        return continents[section].countries.count
    }
    
    // MARK: - Table view functions

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        var continentSection = continents[indexPath.section]
        
        cell.textLabel?.text = continentSection.countries[indexPath.row].name
        cell.backgroundColor = continentSection.countries[indexPath.row].color
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        
        return continents[section].name
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoCountryDetail" {
            if let destination = segue.destination as? CountryDetailViewController,
                let section = tableView.indexPathForSelectedRow?.section,
                let row = tableView.indexPathForSelectedRow?.row {
                
                    destination.selectedCountry = continents[section].countries[row]
            }
        }
    }
    
    // MARK: - Helper
    
    func loadData()
    {
        continents.append(Continent(name: "South America",
                                    countries: [
                                        Country(name: "Brazil", color: .green),
                                        Country(name: "Argentina", color: .cyan),
                                    ])
        )
        
        continents.append(Continent(name: "Europe",
                                    countries: [
                                        Country(name: "Sweden", color: .yellow),
                                        Country(name: "Netherlands", color: .orange),
                                    ])
        )
        
        continents.append(Continent(name: "Asia",
                                    countries: [
                                        Country(name: "Indonesia", color: .red)
                                    ])
        )
    }

}
