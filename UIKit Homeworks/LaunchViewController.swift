//
//  LaunchViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 25.04.2023.
//

import UIKit

final class LaunchViewController: UIViewController {

    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var progressView: UIProgressView!
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLaunch), userInfo: nil, repeats: true)
    }
    
    @objc func updateLaunch() {
        if progressView.progress != 1 && iconImageView.alpha != 1 {
            progressView.progress += 0.1
            progressView.alpha += 0.1
            iconImageView.alpha += 0.1
        } else {
            goToNextViewController()
        }
    }
    
    private func goToNextViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }
}
