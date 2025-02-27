//
//  ViewController.swift
//  RandomColorApp
//
//  Created by hanseoyoung on 2/14/25.
//

import UIKit

class ViewController: UIViewController {
    let firstView = FirstView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(firstView)
        setupUI()
    }

    func setupUI() {
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        firstView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        firstView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

