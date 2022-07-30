//
//  EventDetailTableViewController.swift
//  Koyal
//
//  Created by Abhinay Pratap on 30/07/22.
//

import UIKit

class EventDetailTableViewController: UITableViewController {

    @IBOutlet weak var eventTextField: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var ctgry: String? {
        willSet {
            categoryLabel.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = ""
        eventTextField.delegate = self
        eventTextField.returnKeyType = .done
        eventTextField.autocorrectionType = .no
        
    }
    
    @IBAction func didTapSave(_ sender: UIBarButtonItem) {
        
    }
}


extension EventDetailTableViewController {
    // Unwind Segue
    @IBAction func unwindCategory(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? CategoryTableViewController {
            ctgry = source.selectedCatetory
        }
    }
}

extension EventDetailTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        eventTextField.resignFirstResponder()
        return true
    }
}
