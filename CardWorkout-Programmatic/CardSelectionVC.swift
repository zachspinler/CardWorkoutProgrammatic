//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by zach on 9/6/20.
//  Copyright © 2020 Zach Spinler. All rights reserved.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    var cards: [UIImage] = []
    var timer: Timer!
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton     = CWButton(backgroundColor: .systemGreen, title: "sdfssdfsdfsfdsfsfsdfffdsfsfdsfdsfdsfdfsfdsdfdsfsdffsf")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        populateCards()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    func populateCards() {
        let cardsRange = (2...10).map{String($0)}
        let cardsFigures = ["J", "Q", "K", "A"]
        let cardValues = cardsRange + cardsFigures
        let cardColors = ["C", "D", "H", "S"]
        
        for i in cardValues {
            for j in cardColors {
                cards.append(UIImage(named: i+j) ?? UIImage())
            }
        }
        
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @objc func stopButtonTapped() {
        timer.invalidate()
    }
    
    @objc func resetButtonTapped() {
        timer.invalidate()
        startTimer()
        resetButton.setTitle("Changed", for: .normal)
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
           
           NSLayoutConstraint.activate([
               rulesButton.widthAnchor.constraint(equalToConstant: 115),
               rulesButton.heightAnchor.constraint(equalToConstant: 50),
               rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
               rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
           ])
       }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
}
