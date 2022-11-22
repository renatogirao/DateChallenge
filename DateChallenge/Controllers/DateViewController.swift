//
//  DateViewController.swift
//  DateChallenge
//
//  Created by Renato Savoia Girão on 16/11/22.
//

import UIKit

final class DateViewController: UIViewController {
    
    private var dateView: DateView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        checkDaySchedule()
    }
    
    private func showDayDesign(){
        
    }
    
    private func showAfternoonDesign() {
        
    }
    
    private func showNightDesign() {
        
    }
    
    private func showDawnDesign() {
        
    }
    
    
    
    private func checkDaySchedule() {
        
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        if hour >= 07 && hour < 12 {
            view.backgroundColor = .blue
        } else if hour >= 12 && hour < 18 {
            view.backgroundColor = .red
        } else if hour >= 18 && hour < 24 {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .yellow
        }
        print(hour)
    }
    
    private func buildView() {
        view = DateView()
        dateView = view as? DateView
    }
    
}
