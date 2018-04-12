//
//  CardsPresenter.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

protocol CardsPresenterInterface: class {
    func viewWillAppear()
}

class CardsPresenter {
    let interactor: CardsInteractorInputInterface
    let router: CardsRouterInterface
    weak var view: CardsViewInterface?
    var cards: [Card] = []
    var cardViewModels: [CardViewModel] = []

    init(interactor: CardsInteractorInputInterface, router: CardsRouterInterface) {
        self.interactor = interactor
        self.router = router
    }
}

private extension CardsPresenter {
    
    func configureViewModels() {

        var cardViewModels: [CardViewModel] = []
        for card in cards {

            let viewModel = CardViewModel(type: card.type,
                                          score: card.score,
                                          scoreImage: card.scoreImage,
                                          imageName: card.imageName,
                                          color: card.color,
                                          selectionBlock: { [weak self] in
                self?.navigateToDetail(card: card)
            })

            cardViewModels.append(viewModel)
        }

        self.cardViewModels = cardViewModels
    }

    func navigateToDetail(card: Card) {
        if let viewController = view as? UIViewController {
            router.navigateToDetail(card: card, fromViewController: viewController)
        }
    }
}

extension CardsPresenter: CardsPresenterInterface {

    func viewWillAppear() {
        interactor.getCards()
    }
}

extension CardsPresenter: CardsInteractorOutputInteface {

    func onCards(cards: [Card]) {
        self.cards = cards
        configureViewModels()
        view?.reloadView()
    }
}

extension CardsPresenter: Collectionable {

    func items() -> [Section: [CardViewModel]]? {
        return [0: cardViewModels]
    }
}
