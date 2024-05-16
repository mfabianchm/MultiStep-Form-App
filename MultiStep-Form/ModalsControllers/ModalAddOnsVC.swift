//
//  ModalAddOnsVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 15/05/24.
//

import UIKit

class ModalAddOnsVC: UIViewController {

    let titleLabel = TitleLabel(frame: .zero, text: "Pick add-ons")
    let descriptionLabel = DescriptionLabel(frame: .zero, text: "Add-ons help enhace your gaming experience.")
    let stackView = UIStackView()
    let addOnsChoosed = AddOnsChossed()
    
    var addOnsArray: [AddOn] = addOns
    
    var padding: CGFloat = 20.00
    var addOnAreSelected: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        let views = [
            titleLabel,
            descriptionLabel,
            stackView,
        ]
        
        views.forEach { viewToAdd in
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if (planChoosed.planType == "Yearly") {
            addOnsArray = yearlyaddOns
        }
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        createPlanCards()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func createPlanCards() {
        addOnsArray.indices.forEach { index in
            let button = AddOnButton(addOnName: addOnsArray[index].nameAddOn, price: addOnsArray[index].price, addOnDescription: addOnsArray[index].description)
            button.tag = index
            button.addTarget(self, action: #selector(planButtonPressed(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    
    
    
    func updatePlan(planName: String, price: Int, type: String) {
        planChoosed.planName = planName
        planChoosed.planPrice = price
        planChoosed.planType = type
    }
    
    
    @objc func planButtonPressed(sender: UIButton) {
        
        let checkbox : UIImageView = ((sender as! AddOnButton).checkBoxImage as UIImageView)
        let nameLabel: UILabel = ((sender as! AddOnButton).nameAddOnLabel as UILabel)
        let price: Int = ((sender as! AddOnButton).price as Int)
        let descriptionLabel: UILabel = ((sender as! AddOnButton).descriptionLabel as UILabel)
        
        let addOn = AddOn(nameAddOn: nameLabel.text!, description: descriptionLabel.text!, price: price)
        
        if (!sender.isSelected) {
            sender.isSelected = true
            sender.backgroundColor = UIColor(named: "Magnolia")
            sender.layer.borderColor = UIColor(named: "Purplish-Bue")?.cgColor
            checkbox.backgroundColor = UIColor(named: "Purplish-Bue")
            addOnsChoosed.addOnsToArray(addOn: addOn)
        } else {
            sender.isSelected = false
            sender.layer.borderColor = UIColor(named: "Cool-Gray")?.cgColor
            sender.backgroundColor = .white
            checkbox.backgroundColor = .white
            addOnsChoosed.addOnsChossed.remove(addOn)
        }
        
        
        self.addOnAreSelected = true
    }
}
