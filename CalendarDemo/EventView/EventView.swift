//
//  EventView.swift
//  CalendarDemo
//
//  Created by Mai Hoang Anh on 10/26/17.
//  Copyright © 2017 Anh Mai. All rights reserved.
//

import UIKit

class EventView: UIView {
    let cellIdentifier: String = "EventTableViewCell"
    let dayOfWeeks: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var arrEvents: [EventEntity] {
        var arrEvents: [EventEntity] = []
        let event1 = EventEntity(startTime: "08:00", endTime: "10:00", eventName: "Morning Trip")
        let event2 = EventEntity(startTime: "13:00", endTime: "17:00", eventName: "Meeting at Eastgate")
        arrEvents.append(event1)
        arrEvents.append(event2)
        return arrEvents
    }
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var notifyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpControls()
    }
    
    func setUpControls() {
        let containerView = Bundle.main.loadNibNamed("EventView", owner: self, options: nil)
        if let view = containerView?.first {
            let view = view as! UIView
            view.frame = self.bounds
            self.addSubview(view)
        }
        
        self.tableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: - Calendar cell
    
    func didReceiveCalendarEvent(cell: CalendarViewCell, day: Int) {
        self.dayLabel.text = self.dayOfWeeks[day - 1]
        let isEvent = cell.isEvent
        self.tableView.isHidden = !isEvent
        self.notifyLabel.isHidden = isEvent
    }

}

extension EventView: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Tableview Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventTableViewCell
        cell.updateContentCell(event: self.arrEvents[indexPath.row], index: indexPath.row)
        return cell
    }
    
    // MARK: - Tableview Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
