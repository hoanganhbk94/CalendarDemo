//
//  EventView.swift
//  CalendarDemo
//
//  Created by Anh Mai on 10/23/17.
//  Copyright © 2017 Anh Mai. All rights reserved.
//

import UIKit

class EventView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView() {
        let arrViews = Bundle.main.loadNibNamed("EventView", owner: self, options: nil)
        if let view = arrViews?.first {
            let contentView = view as! UIView
            contentView.frame = self.bounds
            self.addSubview(contentView)
        }
    }
    
}
