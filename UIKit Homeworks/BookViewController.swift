//
//  BookViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

final class BookViewController: UIViewController {
    
    @IBOutlet weak var bookTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookTextView.isEditable = false
        bookTextView.textColor = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        segue.destination.preferredContentSize = CGSize(width: 300, height: 300)
        guard
            let popoverPresentationController = segue.destination.popoverPresentationController,
              let textSettingsViewController = segue.destination as? TextSettingsViewController
        else { return }
        popoverPresentationController.delegate = self
        textSettingsViewController.settingsDelegate = self
    }
}

// MARK: - UIPopoverPresentationControllerDelegate

extension BookViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
    ) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - TextSettingsViewControllerDelegate

extension BookViewController: TextSettingsViewControllerDelegate {
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectColor textColor: UIColor
    ) {
        bookTextView.textColor = textColor
    }
    
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectDarkTheme darkTheme: Bool
    ) {
        if darkTheme == true {
            changeThemeToDark()
        } else {
            changeThemeToLight()
        }
    }
    
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectFont textFont: UIFont
    ) {
        bookTextView.font = textFont
    }
    
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectSize size: CGFloat
    ) {
        bookTextView.font = bookTextView.font?.withSize(size)
    }
    
    private func changeThemeToDark() {
        view.backgroundColor = .black
        bookTextView.backgroundColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 30,
            weight: .heavy)
        ]
        if bookTextView.textColor == .black {
            bookTextView.textColor = .white
        }
    }
    
    private func changeThemeToLight() {
        view.backgroundColor = .white
        bookTextView.backgroundColor = .white
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 30,
            weight: .heavy)
        ]
        if bookTextView.textColor == .white {
            bookTextView.textColor = .black
        }
    }
}
