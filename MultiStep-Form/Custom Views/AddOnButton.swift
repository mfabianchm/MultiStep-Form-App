//
//  AddOnButton.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 15/05/24.
//

import UIKit

class AddOnButton: UIButton {

    var addOnName: String
    var price: Int
    var addOnDescription: String
    
    let cardView = UIView()
    let nameAddOnLabel = UILabel()
    let priceLabel = UILabel()
    let descriptionLabel = UILabel()
    let checkBoxImage = UIImageView()
    
    var padding: CGFloat = 15.00

    init(addOnName: String, price: Int, addOnDescription: String) {
        self.addOnName = addOnName
        self.price = price
        self.addOnDescription = addOnDescription
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cardView)
        makeCardView()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "Cool-Gray")?.cgColor
        self.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
    }
    
    func makeCardView () {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.isUserInteractionEnabled = false
        
        let views = [
            nameAddOnLabel,
            priceLabel,
            descriptionLabel,
            checkBoxImage
        ]
        
        views.forEach { viewToAdd in
            cardView.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let frequencyText = planChoosed.planType == "Yearly" ? "yr" : "mo"
        
        checkBoxImage.image = UIImage(named: "icon-checkmark")
        checkBoxImage.layer.cornerRadius = 2
        checkBoxImage.layer.borderWidth = 1
        checkBoxImage.layer.borderColor = UIColor(named: "Cool-Gray")?.cgColor
        checkBoxImage.layer.masksToBounds = true
        checkBoxImage.contentMode = .scaleAspectFit
        
        nameAddOnLabel.text = addOnName
        nameAddOnLabel.font = UIFont(name: "Ubuntu-Bold", size: 20)
        nameAddOnLabel.textColor = UIColor(named: "Marine Blue")
    
        
        priceLabel.text = "+$\(price.description)/\(frequencyText)"
        priceLabel.font = UIFont(name: "Ubuntu-Regular", size: 17)
        priceLabel.textColor = UIColor(named: "Cool-Gray")
        
        descriptionLabel.text = "2 months free"
        descriptionLabel.textColor = UIColor(named: "Marine Blue")
        descriptionLabel.font = UIFont(name: "Ubuntu-Regular", size: 16)
        
        NSLayoutConstraint.activate([
            checkBoxImage.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            checkBoxImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            checkBoxImage.widthAnchor.constraint(equalToConstant: 20),
            checkBoxImage.heightAnchor.constraint(equalToConstant: 20),
            
            nameAddOnLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding),
            nameAddOnLabel.leadingAnchor.constraint(equalTo: checkBoxImage.trailingAnchor, constant: padding),
            
            priceLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: nameAddOnLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: checkBoxImage.trailingAnchor, constant: padding)
        ])
    }
    

}
