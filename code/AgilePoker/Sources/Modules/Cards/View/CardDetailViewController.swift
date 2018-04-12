//
//  CardDetailViewController.swift
//  AgilePoker
//
//  Created by José María Ila on 27/04/2017.
//  Copyright © 2017 Vector Mobile. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    let card: Card
    var state: Bool

    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 45.0
        self.view.addSubview(view)

        view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10.0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -15.0).isActive = true
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15.0).isActive = true
        view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15.0).isActive = true

        return view
    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 45.0
        self.containerView.addSubview(imageView)

        imageView.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true

        return imageView
    }()

    lazy var scoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 160.0)
        label.textColor = AppColors.black
        label.textAlignment = .center
        self.containerView.addSubview(label)

        label.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 32.0).isActive = true
        label.leftAnchor.constraint(equalTo: self.containerView.leftAnchor, constant: 32).isActive = true
        label.rightAnchor.constraint(equalTo: self.containerView.rightAnchor, constant: -32).isActive = true

        return label
    }()

    lazy var touchGesture: UITapGestureRecognizer = {
        let touchGesture = UITapGestureRecognizer(target: self, action: #selector(touchCard))
        return touchGesture
    }()

    lazy var swipeLeftGesture: UISwipeGestureRecognizer = {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftCard))
        swipeLeftGesture.direction = .left
        return swipeLeftGesture
    }()

    lazy var swipeRightGesture: UISwipeGestureRecognizer = {
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightCard))
        swipeRightGesture.direction = .right
        return swipeRightGesture
    }()

    init(card: Card) {
        self.card = card
        self.state = false
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCard()
    }
    
    func configureView() {
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        view.backgroundColor = AppColors.background
        containerView.addGestureRecognizer(swipeLeftGesture)
        containerView.addGestureRecognizer(swipeRightGesture)
        containerView.addGestureRecognizer(touchGesture)
    }

    func configureCard() {
        containerView.backgroundColor = card.color
        backgroundImageView.image = configureAnimation()
        scoreLabel.text = state ? card.score : ""
        state = !state
    }

    func touchCard() {
        UIView.transition(with: containerView,
                          duration: 1.0,
                          options: .transitionFlipFromRight,
                          animations: { [weak self] in
            self?.configureCard()
        }, completion: nil)
    }

    func swipeLeftCard() {
        UIView.transition(with: containerView,
                          duration: 1.0,
                          options: .transitionFlipFromRight,
                          animations: { [weak self] in
            self?.configureCard()
        }, completion: nil)
    }

    func swipeRightCard() {
        UIView.transition(with: containerView,
                          duration: 1.0,
                          options: .transitionFlipFromLeft,
                          animations: { [weak self] in
            self?.configureCard()
        }, completion: nil)
    }

    func loadImagesAnimation() -> UIImage? {

        var images = [UIImage]()
        for i in 0 ..< 3 {
            let scoreReplaced = card.imageName.replacingOccurrences(of: "_0", with: "")
            let imageName = "\(scoreReplaced)_\(i)"
            if let image = UIImage(named: imageName) {
                images.append(image)
            }
        }

        backgroundImageView.animationImages = images
        backgroundImageView.animationDuration = 1.0
        backgroundImageView.animationRepeatCount = 0
        backgroundImageView.startAnimating()
        return images.first
    }

    func configureAnimation() -> UIImage? {
        if state {
            return loadImagesAnimation()
        } else {
            backgroundImageView.stopAnimating()
            backgroundImageView.animationImages = nil
            return UIImage(named: "back")
        }
    }
}
