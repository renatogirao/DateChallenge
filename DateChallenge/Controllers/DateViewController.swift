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
        dateView?.delegate(delegate: self)
        self.buildView()
        
    }
    
    private func buildView() {
        view = DateView()
        dateView = view as? DateView
    }
}

extension DateViewController: UpdateLayoutDelegateProtocol {
    func updateLayout() {
        dateView?.checkSchedule()
    }
}
