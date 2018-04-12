//
//  CardsRepository.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import Foundation

protocol CardsRepositoryInputInterface {
    func getCards()
}

protocol CardsRepositoryOutputInteface: class {
    func onCards(cards: [Card])
}

class CardsRepository {

    let localDataSource: CardsDataSourceInterface
    weak var output: CardsRepositoryOutputInteface?

    init(localDataSource: CardsDataSourceInterface) {
        self.localDataSource = localDataSource
    }
}

extension CardsRepository: CardsRepositoryInputInterface {

    func getCards() {
        localDataSource.getCards { [weak self] cards in
            self?.output?.onCards(cards: cards)
        }
    }
}
