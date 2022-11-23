//
//  DateView.swift
//  DateChallenge
//
//  Created by Renato Savoia Girão on 16/11/22.
//

import UIKit

class DateView: UIView {
    
    var messageStr = ""
    var imageStr = ""
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    private lazy var backgroundImage: UIImageView = {
        var backgroundImage = UIImageView()
        backgroundImage = UIImageView(frame: CGRectMake(0, 0, width, height))
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = UIImage(named: imageStr)
        return backgroundImage
    }()
    
    private lazy var messageTime: UILabel = {
        let label = UILabel()
        label.text = messageStr
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.layer.borderColor = CGColor(red: 120, green: 120, blue: 120, alpha: 0.6)
        label.layer.cornerRadius = 40
        label.layer.borderWidth = 2
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 60)
        label.backgroundColor = .white
        label.textColor = UIColor(rgb: 0x000000)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var checkScheduleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Que período do dia estamos?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.layer.cornerRadius = 16
        button.layer.borderColor = CGColor(red: 120, green: 120, blue: 120, alpha: 1)
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkSchedule), for: .touchUpInside)
        return button
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
        self.addSubview(backgroundImage)
        self.addSubview(messageTime)
        self.addSubview(checkScheduleButton)
    }
    
    @objc func checkSchedule() {
        
        let date = Date()
        let calendar = Calendar.current
        
//        let hour = calendar.component(.hour, from: date)
        let hour = 00
        
        if hour >= 07 && hour < 12 {
            self.imageStr = "nascer"
            messageStr = "Bom dia!"
        } else if hour >= 12 && hour < 18 {
            self.imageStr = "por"
            messageStr = "Boa tarde!"
        } else if hour >= 18 && hour < 24 {
            self.imageStr = "dark"
            messageStr = "Boa Noite!"
        } else {
            self.imageStr = "madruga"
            messageStr = "Boa madrugada!"
        }
        self.backgroundImage.image = UIImage(named: imageStr)
        self.messageTime.text = messageStr
    }
    
    private func addConstraints() {
        let contraints = [
            messageTime.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageTime.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            messageTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            messageTime.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            checkScheduleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32),
            checkScheduleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            checkScheduleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
            
        ]
        contraints.forEach { (item) in
            item.isActive = true
        }
    }
}

extension DateView: UpdateLayoutDelegate {
    func sendHourToUpdateLayout(hour: Int) {
        self.checkSchedule()
    }
}
