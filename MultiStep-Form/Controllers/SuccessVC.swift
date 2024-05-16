//
//  SuccessVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 07/05/24.
//

import UIKit

class SuccessVC: UIViewController {

    let backgroundImage = UIImageView()
    let stepsStack = StepsStackView(step: 4)
    let succesModal = UIView()
    let imageView = UIImageView()
    let titleLabel = TitleLabel(frame: .zero, text: "Thank you!")
    let descriptionLabel = UILabel()
    let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    lazy var prevStepButton = UIBarButtonItem(title: "Restart", style: .done, target: self, action: #selector(goToRootController))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Magnolia")
        configure()
    }
    
    func configure() {
        setToolbarItems([prevStepButton, flexButton], animated: true)
        view.addSubview(backgroundImage)
        view.addSubview(stepsStack)
        view.addSubview(succesModal)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "bg-sidebar-mobile")
        
        configureSuccessModal()
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 210),
            
            stepsStack.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            stepsStack.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            stepsStack.widthAnchor.constraint(equalToConstant: 200),
            
            succesModal.topAnchor.constraint(equalTo: stepsStack.bottomAnchor, constant: 20),
            succesModal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            succesModal.widthAnchor.constraint(equalToConstant: 350),
            succesModal.heightAnchor.constraint(equalToConstant: 430)
        ])
    }
    
    func configureSuccessModal() {
        succesModal.translatesAutoresizingMaskIntoConstraints = false
        succesModal.backgroundColor = .white
        succesModal.layer.cornerRadius = 10
        
        let views = [
            imageView,
            titleLabel,
            descriptionLabel
        ]
        
        views.forEach { viewToAdd in
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        imageView.image = UIImage(named: "icon-thank-you")
        
        descriptionLabel.text = "Thanks for confirming your subscription! We hope you have fun using our platform. If you ever need support, please feel free to email us at support@loremgaming.com"
        descriptionLabel.numberOfLines = 5
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "Ubuntu-Medium", size: 18)
        descriptionLabel.textColor = UIColor(named: "Cool-Gray")
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: succesModal.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: succesModal.topAnchor, constant: 40),
            
            titleLabel.centerXAnchor.constraint(equalTo: succesModal.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: succesModal.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: succesModal.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: succesModal.trailingAnchor, constant: -10)
        ])
        
    }
    
    @objc func goToNextController() {
        show(SuccessVC(), sender: self)
    }
    
    @objc func goToRootController() {
        navigationController?.popToRootViewController(animated: true)
    }


}
