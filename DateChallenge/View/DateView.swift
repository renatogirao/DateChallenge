//
//  DateView.swift
//  DateChallenge
//
//  Created by Renato Savoia Girão on 16/11/22.
//

import UIKit

class DateView: UIView {
    
    
    private lazy var messageTime: UILabel = {
        let label = UILabel()
        label.text = "Bom dia!"
        label.font = .systemFont(ofSize: 24)
        label.textColor = UIColor(rgb: 0xA2A2A2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(messageTime)
    }
    
    private func addConstraints() {
        let contraints = [
            messageTime.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageTime.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        
        contraints.forEach { (item) in
            item.isActive = true
        }
    }
    
}
