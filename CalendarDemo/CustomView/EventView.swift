//
//  EventView.swift
//  CalendarDemo
//
//  Created by Anh Mai on 10/23/17.
//  Copyright © 2017 Anh Mai. All rights reserved.
//

import UIKit

protocol EventViewDelegate: class {
    func didSelectItem(view: EventView, index: Int)
}

class EventView: UIView {
    
    weak var delegate: EventViewDelegate?
    
    @IBOutlet var arrButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView() {
        let arrViews = Bundle.main.loadNibNamed("EventView", owner: self, options: nil)
        if let view = arrViews?.first {
            let contentView = view as! UIView
            contentView.frame = self.bounds
            self.setHighlightButton(buttonIndex: 0)
            self.addSubview(contentView)
        }
    }
    
    // MARK: - Action
    
    @IBAction func didSelectButtonAction(_ sender: Any) {
        let tagButton = (sender as! UIButton).tag
        self.setHighlightButton(buttonIndex: tagButton)
        
        self.delegate?.didSelectItem(view: self, index: tagButton)
    }
    
    func setHighlightButton(buttonIndex: Int) {
        for index in 0..<self.arrButtons.count {
            let button = self.arrButtons[index]
            button.tintColor = UIColor.white
            if buttonIndex == index {
                button.underlineButton(text: button.currentTitle!)
            } else {
                button.removeUnderlineButton(text: button.currentTitle!)
            }
        }
    }
    
}
