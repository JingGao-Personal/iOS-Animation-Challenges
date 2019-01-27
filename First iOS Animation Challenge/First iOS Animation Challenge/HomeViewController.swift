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
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        
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
        
        view.addSubview(iconImageView)
        view.addSubview(tableView)
        
        layoutScreen()
        bindings()
    }
    
    private func layoutScreen() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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

