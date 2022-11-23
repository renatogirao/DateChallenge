//
//  DateViewController.swift
//  DateChallenge
//
//  Created by Renato Savoia Girão on 16/11/22.
//

import UIKit

protocol UpdateLayoutDelegate {
    func sendHourToUpdateLayout(hour: Int)
}


final class DateViewController: UIViewController {
    
    var delegate: UpdateLayoutDelegate?
    private var dateView: DateView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDaySchedule()
        self.delegate = dateView
    }
    
    private func checkDaySchedule() {
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour >= 07 && hour < 12 {
            view.backgroundColor = .blue
        } else if hour >= 12 && hour < 18 {
            view.backgroundColor = .red
        } else if hour >= 18 && hour < 24 {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .yellow
        }
        
        DispatchQueue.main.async {
            self.buildView()
        }
    }
    
    private func buildView() {
        view = DateView()
        dateView = view as? DateView
    }
}
