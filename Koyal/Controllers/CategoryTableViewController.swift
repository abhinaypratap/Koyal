//
//  CategoryTableViewController.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let categories = [
        "#journal",
        "#happy",
        "#sad",
        "#betrayed",
        "#wish",
        "#prayer",
        "#promise",
        "#reminder",
        "#information",
        "#opinion",
        "#commentary",
        "#observation",
        "#achievement",
        "#warning",
        "#NOTE",
        "#TODO"
    ]
    
    var selectedCatetory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = categories[indexPath.row]
        selectedCatetory = item
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "unwindToEventDetail", sender: cell)
    }
}
