//
//  UserViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 24.04.2023.
//

import UIKit

final class UserViewController: UIViewController {

    @IBOutlet private var userOrderView: UIView!
    
    private let avatarImageView = UIImageView()
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.backgroundColor = .systemGray6
        imagePicker.delegate = self
        
        setupUserAvatar()
        setupUserOrder()
    }
    
    @objc func changeAvatarImage() {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = true

        present(imagePicker, animated: true)
    }
    
    private func setupUserAvatar() {
        avatarImageView.frame = CGRectMake(310, 20, 70, 70)
        if let avatarImage = UserDefaults.standard.value(forKey: "User's avatar") as? Data {
            avatarImageView.image = UIImage(data: avatarImage)
        } else {
            avatarImageView.image = UIImage(named: "avatar")
        }
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 35
        avatarImageView.clipsToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeAvatarImage))
        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        avatarImageView.isUserInteractionEnabled = true
        navigationController?.navigationBar.addSubview(avatarImageView)
    }
    
    private func setupUserOrder() {
        userOrderView.layer.cornerRadius = 10
        userOrderView.clipsToBounds = true
        userOrderView.layer.shadowOffset = CGSize(width: 10, height: 10)
        userOrderView.layer.shadowOpacity = 0.4
        userOrderView.layer.shadowRadius = 10
        userOrderView.layer.shadowColor = UIColor.darkGray.cgColor
        userOrderView.layer.masksToBounds = false
    }
}

extension UserViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            avatarImageView.image = selectedImage
            avatarImageView.contentMode = .scaleAspectFill
            UserDefaults.standard.set(selectedImage.pngData(), forKey: "User's avatar")
            dismiss(animated: true)
        }
    }
}

extension UserViewController: UINavigationControllerDelegate {
    
}
