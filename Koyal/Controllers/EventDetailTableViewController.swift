import UIKit

final class EventDetailTableViewController: UITableViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!

    private let manager = EventManager()

    var ctgry: String? {
        willSet {
            categoryLabel.text = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = ""
        contentTextView.delegate = self
    }

    @IBAction func didTapSave(_ sender: UIBarButtonItem) {
        let event = Event(id: UUID(), content: contentTextView.text, time: Date(), category: categoryLabel.text)
        guard let text1 = contentTextView.text, !text1.isEmpty, let text2 = categoryLabel.text, !text2.isEmpty else {
            return
        }
        print(event)
        manager.createEvent(event: event)
        performSegue(withIdentifier: "unwindToEventVC", sender: sender)
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

extension EventDetailTableViewController: UITextViewDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        contentTextView.resignFirstResponder()
//        return true
//    }
}
