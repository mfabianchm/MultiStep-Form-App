//
//  PlanButton.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 14/05/24.
//

import UIKit

class PlanButton: UIButton {
    
    var image: String
    var planName: String
    var price: Int
    var isMonthly: Bool
    
    let cardView = UIView()
    let logoView = UIImageView()
    let namePlan = UILabel()
    let priceLabel = UILabel()
    let monthsFreeLabel = UILabel()
    
    var padding: CGFloat = 15.00

    init(image: String, plan: String, price: Int, isMonthly: Bool) {
        self.image = image
        self.planName = plan
        self.price = price
        self.isMonthly = isMonthly
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
            logoView,
            namePlan,
            priceLabel,
            monthsFreeLabel
        ]
        
        views.forEach { viewToAdd in
            cardView.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        logoView.image = UIImage(named: image)
        
        namePlan.text = planName
        namePlan.font = UIFont(name: "Ubuntu-Bold", size: 20)
        namePlan.textColor = UIColor(named: "Marine Blue")
    
        if (isMonthly) {
            priceLabel.text = "$\(price.description)/mo"
        } else {
            priceLabel.text = "$\(price.description)/yr"
        }
       
        priceLabel.font = UIFont(name: "Ubuntu-Regular", size: 17)
        priceLabel.textColor = UIColor(named: "Cool-Gray")
        
        monthsFreeLabel.text = "2 months free"
        monthsFreeLabel.textColor = UIColor(named: "Marine Blue")
        monthsFreeLabel.font = UIFont(name: "Ubuntu-Regular", size: 16)
        
        if (isMonthly) {
            monthsFreeLabel.isHidden = true
        } else {
            monthsFreeLabel.isHidden = false
        }
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding),
            logoView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            
            namePlan.topAnchor.constraint(equalTo: logoView.topAnchor),
            namePlan.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: padding),
            
            priceLabel.topAnchor.constraint(equalTo: namePlan.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: padding),
            
            monthsFreeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            monthsFreeLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor)
        ])
    }
    
}
