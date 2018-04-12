//
//  CardsViewController.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

protocol CardsViewInterface: class {
    func reloadView()
}

class CardsViewController: UIViewController {
    let presenter: CardsPresenterInterface
    let collectionViewCollectionable: AnyCollectionable<CardViewModel>

    lazy var collectionView: UICollectionView = {

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            return layout
        }())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = AppColors.clear
        collectionView.register(CardCollectionViewCell.self)
        return collectionView
    }()

    init(presenter: CardsPresenterInterface, collectionViewCollectionable: AnyCollectionable<CardViewModel>) {
        self.presenter = presenter
        self.collectionViewCollectionable = collectionViewCollectionable
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        view.backgroundColor = AppColors.background
        title = "Vector Agile Poker"

        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15.0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15.0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0).isActive = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension CardsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCollectionable.numberOfRows(inSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel: CardViewModel? = collectionViewCollectionable.viewModelForRowAtIndexPath(indexPath: indexPath)
        let cell: CardCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(viewModel: viewModel)
        return cell
    }
}

extension CardsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionViewCollectionable.rowSelectedAtIndexPath(indexPath: indexPath)
    }
}

extension CardsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.width - 30.0) / 3.0
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}

extension CardsViewController: CardsViewInterface {

    func reloadView() {
        collectionView.reloadData()
    }
}
