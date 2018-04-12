//
//  CardsRouter.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

protocol CardsRouterInterface: class {
    func navigateToDetail(card: Card, fromViewController: UIViewController)
}

class CardsRouter {
    let mainRouter: MainRouter

    init(mainRouter: MainRouter) {
        self.mainRouter = mainRouter
    }
}

extension CardsRouter: CardsRouterInterface {

    func navigateToDetail(card: Card, fromViewController: UIViewController) {
        let detailViewController = CardDetailViewController(card: card)
        fromViewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension CardsRouter: RouterFactory {

    static func create(withMainRouter mainRouter: MainRouter) -> UIViewController {

        let localDataSource = CardsDataSource()
        let repository = CardsRepository(localDataSource: localDataSource)
        let interactor = CardsInteractor(repository: repository)
        let router = CardsRouter(mainRouter: mainRouter)
        let presenter = CardsPresenter(interactor: interactor, router: router)
        let collectionViewCollectionable = AnyCollectionable(presenter)
        let view = CardsViewController(presenter: presenter, collectionViewCollectionable: collectionViewCollectionable)

        repository.output = interactor
        interactor.output = presenter
        presenter.view = view

        return view
    }
}
