//
//  ViewController.swift
//  Koyal
//
//  Created by Abhinay Pratap on 12/07/22.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        eventTableView.clearsSelectionOnViewWillAppear = false
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
//        let event = Event(context: PersistentStorage.shared.context)
//        event.id = UUID()
//        event.category = "Fun"
//        event.content = "Had fun learning CoreData framework"
//        event.time = Date()
//
//        PersistentStorage.shared.saveContext()
    }

}


// Unwind Segues
extension EventViewController {
    @IBAction func unwindCancel(_ sender: UIStoryboardSegue) {}
    @IBAction func unwindSave(_ sender: UIStoryboardSegue) {
        
    }
}

//extension EventViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
//
//extension EventViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//}

