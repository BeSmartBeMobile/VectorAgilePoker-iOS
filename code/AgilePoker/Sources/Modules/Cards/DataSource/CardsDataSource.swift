//
//  CardsDataSource.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import Foundation

typealias CardsDataSourceCompletion = (_ data: [Card]) -> Void

protocol CardsDataSourceInterface {
    func getCards(completion: CardsDataSourceCompletion)
}

class CardsDataSource {

}

extension CardsDataSource: CardsDataSourceInterface {

    func getCards(completion: CardsDataSourceCompletion) {

        let cards = [
            Card(type: .text, score: "0", scoreImage: "", imageName: "0_0", color: AppColors.gray),
            Card(type: .text, score: "1/2", scoreImage: "", imageName: "0.5_0", color: AppColors.skin),
            Card(type: .text, score: "1", scoreImage: "", imageName: "1_0", color: AppColors.pinkLight),
            Card(type: .text, score: "2", scoreImage: "", imageName: "2_0", color: AppColors.greenLight),
            Card(type: .text, score: "3", scoreImage: "", imageName: "3_0", color: AppColors.blueLight),
            Card(type: .text, score: "5", scoreImage: "", imageName: "5_0", color: AppColors.yellow),
            Card(type: .text, score: "8", scoreImage: "", imageName: "8_0", color: AppColors.blueDark),
            Card(type: .text, score: "13", scoreImage: "", imageName: "13_0", color: AppColors.pink),
            Card(type: .text, score: "20", scoreImage: "", imageName: "20_0", color: AppColors.green),
            Card(type: .text, score: "40", scoreImage: "", imageName: "40_0", color: AppColors.pinkDark),
            Card(type: .text, score: "90", scoreImage: "", imageName: "90_0", color: AppColors.yellowLight),
            Card(type: .text, score: "100", scoreImage: "", imageName: "100_0", color: AppColors.purple),
            Card(type: .image, score: "", scoreImage: "coffee_small", imageName: "coffee_0", color: AppColors.blue),
            Card(type: .text, score: "∞", scoreImage: "", imageName: "infinite_0", color: AppColors.greenDark),
            Card(type: .text, score: "?", scoreImage: "", imageName: "doubt_0", color: AppColors.grayLight)
        ]

        completion(cards)
    }
}
