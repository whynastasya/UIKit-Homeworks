//
//  BookViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class BookViewController: UIViewController {
    
    
    @IBOutlet weak var bookTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookTextView.isEditable = false
        bookTextView.textColor = .black

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.preferredContentSize = CGSize(width: 300, height: 300)
        guard
            let popoverPresentationController = segue.destination.popoverPresentationController,
              let settingsViewController = segue.destination as? SettingsViewController
        else { return }
        popoverPresentationController.delegate = self
        settingsViewController.settingsDelegate = self
    }
}

extension BookViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

extension BookViewController: SettingsViewControllerDelegate {
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTextColor textColor: UIColor) {
        bookTextView.textColor = textColor
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTheme darkTheme: Bool) {
        if darkTheme == true {
            view.backgroundColor = .black
            bookTextView.backgroundColor = .black
            navigationItem.rightBarButtonItem?.tintColor = .white
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 30, weight: .heavy)]
            if bookTextView.textColor == .black {
                bookTextView.textColor = .white
            }
        } else {
            view.backgroundColor = .white
            bookTextView.backgroundColor = .white
            navigationItem.rightBarButtonItem?.tintColor = .black
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 30, weight: .heavy)]
            if bookTextView.textColor == .white {
                bookTextView.textColor = .black
            }
        }
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTextFont textFont: UIFont) {
        bookTextView.font = textFont
    }
    
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTextSize textSize: CGFloat) {
        bookTextView.font = bookTextView.font?.withSize(textSize)
    }
}
