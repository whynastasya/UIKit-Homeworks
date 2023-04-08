//
//  TextSettingsViewControllerDelegate.swift
//  UIKit Homeworks
//
//  Created by nastasya on 09.04.2023.
//

import UIKit

protocol TextSettingsViewControllerDelegate: AnyObject {
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectSize size: CGFloat
    )
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectColor color: UIColor
    )
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectDarkTheme isDarkTheme: Bool
    )
    func textSettingsViewController(
        _ textSettingsViewController: TextSettingsViewController,
        didSelectFont font: UIFont
    )
}
