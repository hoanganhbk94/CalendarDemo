//
//  EventTableViewCell.swift
//  CalendarDemo
//
//  Created by Mai Hoang Anh on 10/26/17.
//  Copyright © 2017 Anh Mai. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var eventView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateContentCell(event: EventEntity, index: Int) {
        self.timeLable.text = "\(event.startTime) - \(event.endTime)"
        self.eventLabel.text = event.eventName
        self.eventView.backgroundColor = index % 2 == 0 ? UIColor.green : UIColor.blue
    }
    
}
