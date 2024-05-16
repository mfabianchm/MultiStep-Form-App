//
//  StepsStack.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 07/05/24.
//

import UIKit

class StepsStackView: UIStackView {
    
    var step: Int?
    
    let stepsValues: [Int] = [1, 2 , 3, 4]

    init(step: Int) {
        super.init(frame: .zero)
        self.step = step
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .equalSpacing
        alignment = .center
        
        stepsValues.forEach { step in
            let label = UILabel()
            label.text = step.description
            label.textColor = .white
            label.font = UIFont(name: "Ubuntu-Bold", size: 16)
            label.textAlignment = .center
            label.layer.borderColor = UIColor.white.cgColor
            label.layer.borderWidth = 1
            label.layer.cornerRadius = 15.0
            label.layer.masksToBounds = true
            
            if(label.text == self.step?.description) {
                label.backgroundColor = UIColor(named: "Light-Blue")
                label.textColor = UIColor(named: "Marine Blue")
            }
            
            label.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
            label.heightAnchor.constraint(equalToConstant: 30.0).isActive = true

            addArrangedSubview(label)
        }
        
    }
    
}
