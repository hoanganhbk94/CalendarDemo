//
//  EventEntity.swift
//  CalendarDemo
//
//  Created by Mai Hoang Anh on 10/26/17.
//  Copyright © 2017 Anh Mai. All rights reserved.
//

import Foundation

class EventEntity: BaseEntity {
    var startTime: String   = ""
    var endTime: String     = ""
    var eventName: String       = ""
    
    init(startTime: String, endTime: String, eventName: String) {
        self.startTime = startTime
        self.endTime = endTime
        self.eventName = eventName
    }
}
