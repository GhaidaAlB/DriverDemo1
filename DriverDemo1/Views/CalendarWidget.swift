//
//  CalendarWidget.swift
//  DriverDemo1
//
//  Created by Ghaida AlBaltan on 02/03/2024.
//

import SwiftUI
import EventKit



class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var events: [EKEvent] = []
    let eventStore = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        eventStore.requestAccess(to: .event) { (granted, error) in
            if granted {
                self.fetchEvents()
            } else {
                print("Access to calendar denied")
            }
    }

}
    
    func fetchEvents(){
        let startDate = Date()
        let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)!
        
        let predicate = eventsStore.predicateForEvents(withStart: startDate, end: endDate, calendars: nil)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.title
        return cell
    }
        
        /*struct CalendarWidget_Previews: PreviewProvider {
        static var previews: some View {
        CalendarWidget()
        }
        }*/
}
