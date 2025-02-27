//
//  ViewController.swift
//  CounterApp
//
//  Created by hanseoyoung on 2/20/25.
//

import UIKit

class ViewController: UIViewController {

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var count: Int = 0 {
        didSet {
            numberLabel.text = "\(count)"
            updateButtonStates()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        updateButtonStates()
    }

    // MARK: - Setup UI

    private func setupUI() {
        view.addSubview(numberLabel)
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let buttonStack = UIStackView(arrangedSubviews: [minusButton, resetButton, plusButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 20
        buttonStack.distribution = .fillEqually
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)

        NSLayoutConstraint.activate([
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonStack.heightAnchor.constraint(equalToConstant: 50)
        ])

        plusButton.addTarget(self, action: #selector(handlePlus), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(handleMinus), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
    }

    // MARK: - Button Actions

    @objc private func handlePlus() {
        if count < 10 {
            count += 1
        }
    }

    @objc private func handleMinus() {
        if count > -10 {
            count -= 1
        }
    }

    @objc private func handleReset() {
        count = 0
    }

    private func updateButtonStates() {
        plusButton.isEnabled = count < 10
        minusButton.isEnabled = count > -10
    }
}


