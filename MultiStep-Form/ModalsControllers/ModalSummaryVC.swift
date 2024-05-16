//
//  ModalSummaryVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 15/05/24.
//

import UIKit


class ModalSummaryVC: UIViewController {
    

    var planName: String?
    var planType: String?
    var planPrice: Int?
    var addOns: Set<AddOn>
    

    let titleLabel = TitleLabel(frame: .zero, text: "Finishing up")
    let descriptionLabel = DescriptionLabel(frame: .zero, text: "Double-check everything looks OK before confirming.")
    let totalLabel = UILabel()
    let priceTotalLabel = UILabel()
   
    
    var padding: CGFloat = 20.00
    var addOnAreSelected: Bool = false
    
    init (addOnsToAdd: Set<AddOn>) {
        self.addOns = addOnsToAdd
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        let planDetailsView = PlanDetailsView(planDetails: planChoosed, addOnsToShow: addOns)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        let views = [
            titleLabel,
            descriptionLabel,
            planDetailsView,
            totalLabel,
            priceTotalLabel
        ]
        
        views.forEach { viewToAdd in
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let frequencyText = planChoosed.planType == "Yearly" ? "yr" : "mo"
        
        totalLabel.text = "Total (per month)"
        totalLabel.font = UIFont(name: "Ubuntu-Medium", size: 16)
        totalLabel.textColor = UIColor(named: "Cool-Gray")
        
        priceTotalLabel.text = "+$\(calculatePrice())/\(frequencyText)"
        priceTotalLabel.textColor = UIColor(named: "Purplish-Bue")
        priceTotalLabel.font = UIFont(name: "Ubuntu-Bold", size: 19)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            planDetailsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            planDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            planDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            planDetailsView.heightAnchor.constraint(equalToConstant: 195),
            
            totalLabel.topAnchor.constraint(equalTo: planDetailsView.bottomAnchor, constant: padding),
            totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            
            priceTotalLabel.topAnchor.constraint(equalTo: planDetailsView.bottomAnchor, constant: padding),
            priceTotalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
                                                    
            
        ])
    
    }
    
    func calculatePrice () -> Int {
        if (!addOns.isEmpty) {
            let sumAddOns = addOns.reduce(0) { (result, addOn) in
                return result + addOn.price
            }
            return sumAddOns + planChoosed.planPrice
        }
        
        return planChoosed.planPrice
    }
    
    
}
