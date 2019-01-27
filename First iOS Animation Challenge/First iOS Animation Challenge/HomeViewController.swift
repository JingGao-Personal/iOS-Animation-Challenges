//
//  ViewController.swift
//  First iOS Animation Challenge
//
//  Created by Jing Gao on 27/1/19.
//  Copyright © 2019 Jing and Yu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private lazy var maskLayer: CAShapeLayer = {
        let _maskLayer = CAShapeLayer()
        _maskLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 50, height: 50)).cgPath
        _maskLayer.fillColor = #colorLiteral(red: 0.9529411765, green: 0.9647058824, blue: 0.968627451, alpha: 1).cgColor
        return _maskLayer
    }()
    
    private lazy var pinkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pinkHeart")
        
        return imageView
    }()
    
    private lazy var whiteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "whiteHeart")
        
        return imageView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.layer.cornerRadius = 4
        tableView.layer.borderColor = #colorLiteral(red: 0.2196078431, green: 0.737254902, blue: 0.4666666667, alpha: 1)
        tableView.layer.borderWidth = 1
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Searching Bar Animation"
        view.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9647058824, blue: 0.968627451, alpha: 1)
        
        view.addSubview(pinkImageView)
        pinkImageView.layer.addSublayer(maskLayer)
        view.addSubview(whiteImageView)
        view.addSubview(tableView)
        
        layoutScreen()
        bindings()
    }
    
    private func layoutScreen() {
        NSLayoutConstraint.activate([
            whiteImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            whiteImageView.widthAnchor.constraint(equalToConstant: 50),
            whiteImageView.heightAnchor.constraint(equalToConstant: 50),
            whiteImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pinkImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            pinkImageView.widthAnchor.constraint(equalToConstant: 50),
            pinkImageView.heightAnchor.constraint(equalToConstant: 50),
            pinkImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    private func bindings() {
        tableView.rx.didScroll
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] in
                self?.animateIconImageView()
            })
            .dispose()
    }
    
    private func animateIconImageView() {
        
    }
}

