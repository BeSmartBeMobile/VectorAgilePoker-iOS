//
//  CardsInteractor.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import Foundation

protocol CardsInteractorInputInterface {
    func getCards()
}

protocol CardsInteractorOutputInteface: class {
    func onCards(cards: [Card])
}

class CardsInteractor {

    let repository: CardsRepositoryInputInterface
    weak var output: CardsInteractorOutputInteface?

    init(repository: CardsRepositoryInputInterface) {
        self.repository = repository
    }
}

extension CardsInteractor: CardsInteractorInputInterface {

    func getCards() {
        repository.getCards()
    }
}

extension CardsInteractor: CardsRepositoryOutputInteface {

    func onCards(cards: [Card]) {
        output?.onCards(cards: cards)
    }
}
