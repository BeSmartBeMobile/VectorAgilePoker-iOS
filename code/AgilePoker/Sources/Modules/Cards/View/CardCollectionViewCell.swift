//
//  CardCollectionViewCell.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    var viewModel: CardViewModel?

    lazy var containerView: UIView = {

        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14.0
        self.addSubview(view)

        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        return view
    }()
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 54.0)
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        self.containerView.addSubview(label)

        label.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -10).isActive = true
        label.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true

        return label
    }()

    lazy var scoreImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        self.containerView.addSubview(imageView)

        imageView.heightAnchor.constraint(equalToConstant: 68.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 68.0).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor).isActive = true

        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardCollectionViewCell {

    override func prepareForReuse() {
        configure(viewModel: nil)
    }
}

extension CardCollectionViewCell: CollectionableViewModelCellConfigurable {

    func configure(viewModel: CardViewModel?) {
        self.viewModel = viewModel
        containerView.backgroundColor = viewModel?.color
        scoreLabel.text = viewModel?.score

        if let cardType = viewModel?.type {
            switch cardType {
            case .image:
                configureImage(imageName: viewModel?.scoreImage)
                break
            default:
                configureImage(imageName: "")
                break
            }
        }
    }

    private func configureImage(imageName: String?) {
        if let name = imageName {
            scoreImageView.image = UIImage(named: name)
        } else {
            scoreImageView.image = nil
        }
    }
}
