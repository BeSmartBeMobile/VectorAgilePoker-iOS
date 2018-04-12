//
//  MainRouter.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

protocol MainRouterInterface {
    func show(viewController: UIViewController, sender: Any?)
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?)
}

protocol RouterFactory {
    static func create(withMainRouter mainRouter: MainRouter) -> UIViewController
}

class MainRouter {
    let window: UIWindow

    var rootViewController: UIViewController {

        guard let rootViewController = window.rootViewController else {
            fatalError("There is no rootViewController installed on the window")
        }

        return rootViewController
    }

    init(window: UIWindow) {
        self.window = window
    }
}

extension MainRouter {

    static func apply(_ window: UIWindow) {
        MainRouter.applyWindowStyle(window)
        MainRouter.applyNavigationBarStyle()
    }

    func presentRootViewController() {
        let cardsViewController = CardsRouter.create(withMainRouter: self)
        let navigationController = UINavigationController(rootViewController: cardsViewController)
        window.rootViewController = navigationController
    }
}

private extension MainRouter {

    static func applyWindowStyle(_ window: UIWindow) {
        window.backgroundColor = AppColors.background
        window.tintColor = AppColors.background
    }

    static func applyNavigationBarStyle() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = AppColors.black
        appearance.barTintColor = AppColors.tint
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [NSForegroundColorAttributeName: AppColors.black]
    }
}

extension MainRouter: MainRouterInterface {

    func show(viewController: UIViewController, sender: Any?) {
        rootViewController.show(viewController, sender: sender)
    }

    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?) {
        rootViewController.present(viewController, animated: animated, completion: completion)
    }
}
