//
//  PlanDetailsView.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 15/05/24.
//

import UIKit

class PlanDetailsView: UIView {
    
    var planDetails: PlanChoosed
    var addOns: Set<AddOn>
    
    let planNameLabel = UILabel()
    let priceLabel = UILabel()
    let totalLabel = UILabel()
    let planInfoView = UIView()
    let stackView = UIStackView()
    let border = UIView()
    
    var padding: CGFloat = 10.00

    init(planDetails: PlanChoosed, addOnsToShow: Set<AddOn>) {
        self.planDetails = planDetails
        self.addOns = addOnsToShow
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor(named: "Magnolia")
        
        let views = [
            planNameLabel,
            priceLabel,
            totalLabel,
            stackView,
            planInfoView,
            border
        ]
        
        let frequencyText = planDetails.planType == "Monthly" ? "mo" : "yr"
        
        views.forEach { viewToAdd in
            self.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        planNameLabel.text = "\(planDetails.planName) (\(planDetails.planType))"
        planNameLabel.textColor = UIColor(named: "Marine Blue")
        planNameLabel.font = UIFont(name: "Ubuntu-Bold", size: 16)
        
        priceLabel.text = "$\(planDetails.planPrice.description)/\(frequencyText)"
        priceLabel.textColor = UIColor(named: "Marine Blue")
        priceLabel.font = UIFont(name: "Ubuntu-Bold", size: 16)
        
        planInfoView.addSubview(planNameLabel)
        planInfoView.addSubview(priceLabel)
        
        border.backgroundColor = UIColor(named: "Cool-Gray")
        
        configureStack()
        
        NSLayoutConstraint.activate([
            planInfoView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            planInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            planInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            planInfoView.heightAnchor.constraint(equalToConstant: 60),
            
            planNameLabel.centerYAnchor.constraint(equalTo: planInfoView.centerYAnchor),
            planNameLabel.leadingAnchor.constraint(equalTo: planInfoView.leadingAnchor),
            
            priceLabel.centerYAnchor.constraint(equalTo: planInfoView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: planInfoView.trailingAnchor),
            
            border.topAnchor.constraint(equalTo: planInfoView.bottomAnchor, constant: padding),
            border.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            border.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            border.heightAnchor.constraint(equalToConstant: 1),
            
            stackView.topAnchor.constraint(equalTo: border.bottomAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureStack() {
        let frequencyText = planDetails.planType == "Monthly" ? "mo" : "yr"
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        if(addOns.isEmpty) {
            let view = UIView()
            let label = UILabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(view)
            view.addSubview(label)
            
            label.text = "No AddOns Selected"
            label.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        } else {
            addOns.forEach {addOn in
                let addOnView = UIView()
                let nameLabel = UILabel()
                let priceLabel = UILabel()
                
                stackView.addArrangedSubview(addOnView)
                addOnView.addSubview(nameLabel)
                addOnView.addSubview(priceLabel)
                
                addOnView.translatesAutoresizingMaskIntoConstraints = false
                nameLabel.translatesAutoresizingMaskIntoConstraints = false
                priceLabel.translatesAutoresizingMaskIntoConstraints = false
                
                nameLabel.text = addOn.nameAddOn
                nameLabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
                nameLabel.textColor = UIColor(named: "Cool-Gray")
                
                priceLabel.text = "+$\(addOn.price)/\(frequencyText)"
                priceLabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
                priceLabel.textColor = UIColor(named: "Marine Blue")
                
                NSLayoutConstraint.activate([
                    nameLabel.leadingAnchor.constraint(equalTo: addOnView.leadingAnchor),
                    nameLabel.centerYAnchor.constraint(equalTo: addOnView.centerYAnchor),
                    
                    priceLabel.trailingAnchor.constraint(equalTo: addOnView.trailingAnchor),
                    priceLabel.centerYAnchor.constraint(equalTo: addOnView.centerYAnchor)
                ])
            }
        }
        
//        guard let addOnsToDisplay = addOns else {
//            let view = UIView()
//            let label = UILabel()
//            view.translatesAutoresizingMaskIntoConstraints = false
//
//            stackView.addArrangedSubview(view)
//            view.addSubview(label)
//
//            label.text = "No AddOns Selected"
//            label.translatesAutoresizingMaskIntoConstraints = false
//
//            NSLayoutConstraint.activate([
//                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            ])
//
//            return
//        }
//
//        addOnsToDisplay.forEach {addOn in
//            let addOnView = UIView()
//            let nameLabel = UILabel()
//            let priceLabel = UILabel()
//
//            stackView.addArrangedSubview(addOnView)
//            addOnView.addSubview(nameLabel)
//            addOnView.addSubview(priceLabel)
//
//            addOnView.translatesAutoresizingMaskIntoConstraints = false
//            nameLabel.translatesAutoresizingMaskIntoConstraints = false
//            priceLabel.translatesAutoresizingMaskIntoConstraints = false
//
//            nameLabel.text = addOn.nameAddOn
//            nameLabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
//            nameLabel.textColor = UIColor(named: "Cool-Gray")
//
//            priceLabel.text = "+$\(addOn.price)/\(frequencyText)"
//            priceLabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
//            priceLabel.textColor = UIColor(named: "Marine Blue")
//        }
    }
    
}


