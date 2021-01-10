//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by zach on 9/6/20.
//  Copyright © 2020 Zach Spinler. All rights reserved.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    
    func configure() {
        layer.cornerRadius = 8
//        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        titleLabel?.font = UIFont(name: "System", size: 12)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
