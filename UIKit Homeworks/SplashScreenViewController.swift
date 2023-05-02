//
//  SplashScreenViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 02.05.2023.
//

import UIKit

final class SplashScreenViewController: UIPageViewController {

    private let pageControl = UIPageControl()
    private let nextViewControllerButton = UIButton()
    
    private var items = [
        ItemForSplashScreen(
            text: "Текст Текст Текст Текст Текст Текст Текст",
            image: "item_1"),
            ItemForSplashScreen(text: "Текст Текст Текст Текст",
            image: "item_2"),
            ItemForSplashScreen(text: "Текст Текст Текст ТекстТекст",
            image: "item_3"),
            ItemForSplashScreen(text: "ТекстТекстТекстТекстТекстТекст",
            image: "item_4"
        )
    ]
    private var itemViewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in items {
            itemViewControllers.append(ItemForSplashScreenViewController(item: item))
        }
        
        view.backgroundColor = .white
        setupPageViewController()
        setupPageControl()
    }
    
    @objc func goToNextViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(
            withIdentifier: "TabBarController"
        ) as? TabBarController else { return }
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true)
    }
    
    private func setupPageViewController() {
        setViewControllers([itemViewControllers[0]], direction: .forward, animated: true)
        self.dataSource = self
        self.delegate = self
    }
    
    private func setupPageControl() {
        pageControl.frame = CGRectMake(0, view.frame.maxY - 70, 150, 20)
        pageControl.center.x = view.center.x
        pageControl.numberOfPages = items.count
        pageControl.backgroundColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.currentPage = 0
        view.addSubview(pageControl)
    }
    
    private func setupNextViewControllerButton() {
        nextViewControllerButton.frame = CGRectMake(0, 550, 300, 50)
        nextViewControllerButton.center.x = view.center.x
        nextViewControllerButton.alpha = 0
        nextViewControllerButton.layer.cornerRadius = 20
        nextViewControllerButton.layer.shadowOffset = CGSizeMake(10, 10)
        nextViewControllerButton.layer.shadowOpacity = 0.5
        nextViewControllerButton.layer.shadowRadius = 10
        nextViewControllerButton.layer.shadowColor = UIColor.gray.cgColor
        nextViewControllerButton.backgroundColor = .black
        nextViewControllerButton.setAttributedTitle(NSAttributedString(
            string: "Перейти в приложение",
            attributes: [
                .font: UIFont.systemFont(ofSize: 20, weight: .heavy),
                .foregroundColor: UIColor.white
            ]),
            for: .normal
        )
        nextViewControllerButton.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        view.addSubview(nextViewControllerButton)
    }
    
    private func animateNextViewControllerButton() {
        UIView.animate(withDuration: 0.5, delay: 2) {
            self.nextViewControllerButton.alpha = 1
        }
    }
}

extension SplashScreenViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        itemViewControllers.count
    }
}

extension SplashScreenViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        
        pageControl.currentPage -= 1
        guard let currentViewController = viewController as? ItemForSplashScreenViewController else { return nil }
        let index = itemViewControllers.firstIndex(of: currentViewController)
        if index! > 0 {
            return itemViewControllers[index! - 1]
        }
        
        return nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        
        pageControl.currentPage += 1
        guard let currentViewController = viewController as? ItemForSplashScreenViewController else { return nil }
        let index = itemViewControllers.firstIndex(of: currentViewController)
        if index! < items.count - 1 {
            return itemViewControllers[index! + 1]
        }
        
        if index == items.count - 1 {
            setupNextViewControllerButton()
            animateNextViewControllerButton()
        }
        
        return nil
    }
}
