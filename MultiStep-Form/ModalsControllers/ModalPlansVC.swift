//
//  ModalPlansVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 13/05/24.
//

import UIKit

class ModalPlansVC: UIViewController {
    
    let titleLabel = TitleLabel(frame: .zero, text: "Select your plan")
    let descriptionLabel = DescriptionLabel(frame: .zero, text: "You have the option of monthly or yearly billing.")
    let stackView = UIStackView()
    let planTypeSelectionView = UIView()
    let montlyLabel = UILabel()
    let yearlyLabel = UILabel()
    let planSwitch = UISwitch()
    
    var plans: [PlanCard] = monthlyPlans
    
    var padding: CGFloat = 20.00
    var displayMonthly: Bool = true
    var planIsSelected: Bool = false

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
            planTypeSelectionView
        ]
        
        views.forEach { viewToAdd in
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        createPlanCards()
        configurePlanSwitcher()
        
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
            
            planTypeSelectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            planTypeSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            planTypeSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            planTypeSelectionView.heightAnchor.constraint(equalToConstant: 70),
            
        ])
    }
    
    func createPlanCards() {
        plans.indices.forEach { index in
            let button = PlanButton(image: plans[index].image , plan: plans[index].planName, price: plans[index].price, isMonthly: plans[index].isMonthly)
            button.tag = index
            button.addTarget(self, action: #selector(planButtonPressed(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    func configurePlanSwitcher() {
        planTypeSelectionView.backgroundColor = UIColor(named: "Alabaster")
        
        planTypeSelectionView.addSubview(montlyLabel)
        planTypeSelectionView.addSubview(yearlyLabel)
        planTypeSelectionView.addSubview(planSwitch)
        
        montlyLabel.translatesAutoresizingMaskIntoConstraints = false
        yearlyLabel.translatesAutoresizingMaskIntoConstraints = false
        planSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        montlyLabel.text = "Monthly"
        montlyLabel.textColor = UIColor(named: "Marine Blue")
        montlyLabel.font = UIFont(name: "Ubuntu-Bold", size: 18)
        
        yearlyLabel.text = "Yearly"
        yearlyLabel.textColor = UIColor(named: "Cool-Gray")
        yearlyLabel.font = UIFont(name: "Ubuntu-Bold", size: 18)
        
        planSwitch.thumbTintColor = .white
        planSwitch.backgroundColor = UIColor(named: "Marine Blue")
        planSwitch.onTintColor = UIColor(named: "Marine Blue")
        planSwitch.layer.cornerRadius = 15
        planSwitch.addTarget(self, action: #selector(changePlan(sender:)), for: UIControl.Event.valueChanged)
        
        NSLayoutConstraint.activate([
            planSwitch.centerXAnchor.constraint(equalTo: planTypeSelectionView.centerXAnchor),
            planSwitch.centerYAnchor.constraint(equalTo: planTypeSelectionView.centerYAnchor),
            
            montlyLabel.trailingAnchor.constraint(equalTo: planSwitch.leadingAnchor, constant: -20),
            montlyLabel.centerYAnchor.constraint(equalTo: planTypeSelectionView.centerYAnchor),
            
            yearlyLabel.leadingAnchor.constraint(equalTo: planSwitch.trailingAnchor, constant: 20),
            yearlyLabel.centerYAnchor.constraint(equalTo: planTypeSelectionView.centerYAnchor),
        ])
    }
    
    func changeSwitchTextColor() {
        if (planSwitch.isOn) {
            montlyLabel.textColor = UIColor(named: "Cool-Gray")
            yearlyLabel.textColor = UIColor(named: "Marine Blue")
        } else {
            montlyLabel.textColor = UIColor(named: "Marine-Blue")
            yearlyLabel.textColor = UIColor(named: "Cool-Gray")
        }
    }
    
    func updatePlan(planName: String, price: Int, type: String) {
        planChoosed.planName = planName
        planChoosed.planPrice = price
        planChoosed.planType = type
    }
    
    @objc func changePlan(sender: UISwitch) {
        self.planIsSelected = false
        changeSwitchTextColor()
        if(planSwitch.isOn) {
            self.plans = yearlyPlans
            self.displayMonthly = false
        } else {
            self.plans = monthlyPlans
            self.displayMonthly = true
        }
        stackView.removeAllArrangedSubviews()
        createPlanCards()
    }
    
    
    @objc func planButtonPressed(sender: UIButton) {
        self.planIsSelected = true
        
        let buttons = stackView.arrangedSubviews
        buttons.forEach { button in
            button.layer.borderColor = UIColor(named: "Cool-Gray")?.cgColor
            button.backgroundColor = .white
        }
        
        sender.backgroundColor = UIColor(named: "Magnolia")
        sender.layer.borderColor = UIColor(named: "Purplish-Bue")?.cgColor
        
        switch sender.tag {
        case 0:
            planChoosed.planName = "Arcade"
            if(displayMonthly) {
                planChoosed.planType = "Monthly"
                planChoosed.planPrice = 9
            } else {
                planChoosed.planType = "Yearly"
                planChoosed.planPrice = 90
            }
        case 1:
            planChoosed.planName = "Advanced"
            if(displayMonthly) {
                planChoosed.planType = "Monthly"
                planChoosed.planPrice = 12
            } else {
                planChoosed.planType = "Yearly"
                planChoosed.planPrice = 120
            }
        case 2:
            planChoosed.planName = "Pro"
            if(displayMonthly) {
                planChoosed.planType = "Monthly"
                planChoosed.planPrice = 15
            } else {
                planChoosed.planType = "Yearly"
                planChoosed.planPrice = 150
            }
        default:
            break
        }
        
    }
}


extension UIStackView {
    
    func removeAllArrangedSubviews() {
        
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
