//
//  ViewController.swift
//  Chapter_8_Sections
//
//  Created by Wei Li on 18/01/2017.
//  Copyright © 2017 Wei Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let sectionsTableIdentifier = "SectionsTableIdentifier"
    @IBOutlet weak var tableView: UITableView!
    var names: [String: [String]]!
    var keys: [String]!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.registerClass(UITableViewCell.self,
                                forCellReuseIdentifier: sectionsTableIdentifier)
        let path = NSBundle.mainBundle().pathForResource(
            "sortednames", ofType: "plist")
        let namesDict = NSDictionary(contentsOfFile: path!)
        names = namesDict as! [String: [String]]
        keys = (namesDict!.allKeys as! [String]).sort()
        
        let resultsController = SearchResultsController()
        resultsController.names = names
        resultsController.keys = keys
        searchController =
            UISearchController(searchResultsController: resultsController)
        let searchBar = searchController.searchBar
        searchBar.scopeButtonTitles = ["All", "Short", "Long"]
        searchBar.placeholder = "Enter a search term"
        searchBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        searchController.searchResultsUpdater = resultsController
        
        tableView.sectionIndexBackgroundColor = UIColor.blackColor()
        tableView.sectionIndexTrackingBackgroundColor = UIColor.darkGrayColor()
        tableView.sectionIndexColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table View Data Source Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]!
        return nameSection.count
    }
    
    func tableView(tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(sectionsTableIdentifier, forIndexPath:
                indexPath)
                as UITableViewCell
            let key = keys[indexPath.section]
            let nameSection = names[key]!
            cell.textLabel!.text = nameSection[indexPath.row]
            return cell
    }
    
    // This function shows the titles of each group on the right of screen.
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys
    }
}

