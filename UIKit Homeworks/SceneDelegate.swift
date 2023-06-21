//
//  SceneDelegate.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        
        let newsFeedViewController = UINavigationController(rootViewController: NewsFeedViewController())
        
        newsFeedViewController.tabBarItem.image = UIImage(systemName: "house")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        newsFeedViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let recommendationViewController = RecommendationViewController()
        recommendationViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let publicationViewController = AddPublicationViewController()
        publicationViewController.tabBarItem.image = UIImage(systemName: "plus.app")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let reelsViewController = ReelsViewController()
        reelsViewController.tabBarItem.image = UIImage(systemName: "play.square")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        reelsViewController.tabBarItem.selectedImage = UIImage(systemName: "play.square.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let userAccountViewController = UINavigationController(rootViewController:UserAccountViewController())
        userAccountViewController.tabBarItem.image = UIImage(systemName: "person.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        userAccountViewController.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .black
        tabBarController.setViewControllers([newsFeedViewController,
                                             recommendationViewController,
                                             publicationViewController,
                                             reelsViewController,
                                             userAccountViewController],
                                             animated: true)
        tabBarController.selectedViewController = userAccountViewController
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

