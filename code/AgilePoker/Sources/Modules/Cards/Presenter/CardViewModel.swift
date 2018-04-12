//
//  CardViewModel.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

struct CardViewModel {
    let type: CardType
    let score: String
    let scoreImage: String
    let imageName: String
    let color: UIColor
    let selectionBlock: () -> Void
}

extension CardViewModel: CollectionableViewModel {

    func onRowSelected() {
        selectionBlock()
    }
}
