//
//  BirthdayViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 26.02.2023.
//

import UIKit

class BirthdayViewController: UIViewController {

    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var someButton: UIButton?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var name: String = ""
    var date = Date()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if name != "" {
            update(name: name, date: date)
        }
    }
    
    func update(name: String, date: Date) {
        let age: Int
        let daysLeft = Calendar.current.dateComponents([.day], from: .now, to: date as Date).day
        let year = Calendar.current.component(.year, from: date as Date)
        daysLeftLabel.text = daysLeft!.description + "дней"
        nameLabel.text = name
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        if daysLeft! < 365 {
            age = 2023 - year
        } else {
            age = 2023 - year + 1
        }
        dateLabel.text = formatter.string(from: date as Date) + ", исполняется \(age)"
        
        someButton?.layer.borderWidth = 1
        someButton?.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView.tintColor = .lightGray
        nameLabel.textColor = .black
        dateLabel.textColor = .black
        daysLeftLabel.textColor = .black
    }
    
    @IBAction func unwindToAddVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        update(name: name, date: date)
//        name = sourceViewController.name
        // Use data from the view controller which initiated the unwind segue
    }
}
