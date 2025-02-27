//
//  View.swift
//  RandomColorApp
//
//  Created by hanseoyoung on 2/17/25.
//

import UIKit

class FirstView: UIView {
    let randomRed = CGFloat.random(in: 0...1)
    let randomGreen = CGFloat.random(in: 0...1)
    let randomBlue = CGFloat.random(in: 0...1)
    lazy var randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R: 255, G: 255, B: 255"
        label.textAlignment = .center
        return label
    }()

    var changeColorButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Change Color", for: .normal)
        return button
    }()

    var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reset", for: .normal)
        return button
    }()

    override init(frame: CGRect) {  //UIView 요소들이 실제로 화면안에 추가되어 어떻게 배치가 되는지 View를 초기화 하는 메소드
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(titleLabel)
        addSubview(changeColorButton)
        addSubview(resetButton)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 200)
        ])

        NSLayoutConstraint.activate([
            changeColorButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            changeColorButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -10),
            changeColorButton.heightAnchor.constraint(equalToConstant: 44),
            changeColorButton.widthAnchor.constraint(equalToConstant: 120),

            resetButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            resetButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 10),
            resetButton.heightAnchor.constraint(equalToConstant: 44),
            resetButton.widthAnchor.constraint(equalToConstant: 120)
        ])

        changeColorButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetColor), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {    //슈퍼 클래스를 상속받는 모든 서브 클래스는 생성자의 재정의를 필수적으로 해주어야 함
        fatalError("init(coder:) has not been implemented")
    }

    @objc func changeColor() {
        let randomRed = CGFloat.random(in: 0...1)
        let randomGreen = CGFloat.random(in: 0...1)
        let randomBlue = CGFloat.random(in: 0...1)

        backgroundColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)

        titleLabel.text = "R: \(Int(randomRed * 255)), G: \(Int(randomGreen * 255)), B: \(Int(randomBlue * 255))"
    }

    @objc func resetColor() {
        backgroundColor = .white
        titleLabel.text = "R: 255, G: 255, B: 255"
    }
}
