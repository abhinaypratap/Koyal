import UIKit
import CoreData

final class EventViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    private let manager = EventManager()
    var events = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
//        eventTableView.clearsSelectionOnViewWillAppear = false
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])

        eventTableView.delegate = self
        eventTableView.dataSource = self
        populateTable()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateTable()
    }
}

// Unwind Segues
extension EventViewController {
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

extension EventViewController {
    func populateTable() {
        events = manager.fetchEvent()
        DispatchQueue.main.async {
            self.eventTableView.reloadData()
        }
    }
}

extension EventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventTableView.deselectRow(at: indexPath, animated: true)
        print("didSelectRowAt")
    }
}

extension EventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = eventTableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        let event = events[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM YYYY hh:mm a"
        cell.timeLabel.text = dateFormatter.string(from: event.time!)
        cell.contentLabel.text = event.content
        cell.categoryLabel.text = event.category
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        events.count
    }
}
