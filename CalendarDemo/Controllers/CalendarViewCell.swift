//
//  CalendarViewCell.swift
//  CalendarDemo
//
//  Created by Anh Mai on 10/20/17.
//  Copyright © 2017 Anh Mai. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewCell: JTAppleCell {
    
    var isEvent: Bool = false
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var eventView: UIView!
    
    @IBOutlet weak var widthSelectedCellConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let sizeSelectedCell: CGFloat = UIScreen.main.bounds.width / 7.0 - 10.0
        self.widthSelectedCellConstraint.constant = sizeSelectedCell
        self.selectedView.layer.cornerRadius = sizeSelectedCell / 2
    }
    
    func updateContentCalendarCell(cell: JTAppleCell, cellState: CellState, isEvent: Bool) {
        self.isEvent = isEvent
        self.eventView.isHidden = !self.isEvent
        self.dateLabel.text = cellState.text
    }

}
