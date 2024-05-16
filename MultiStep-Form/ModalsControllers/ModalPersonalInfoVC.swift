//
//  ModalPersonalInfoVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 07/05/24.
//

import UIKit

class ModalPersonalInfoVC: UIViewController, UITextFieldDelegate {
    
    let titleLabel = TitleLabel(frame: .zero, text: "Personal Info")
    let descriptionLabel = DescriptionLabel(frame: .zero, text: "Please provide your name, email, addres, and phone number.")
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()
    let nameField = UITextField()
    let emailField = UITextField()
    let phoneField = UITextField()
    
    var padding: CGFloat = 20.00
    
    var nameValue: String = ""
    var emailValue: String = ""
    var phoneValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureFields()
    }
    
    func configure() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        nameField.delegate = self
        emailField.delegate = self
        phoneField.delegate = self
        
        let views = [
            titleLabel,
            descriptionLabel,
            nameLabel,
            emailLabel,
            phoneLabel,
            nameField,
            emailField,
            phoneField
        ]
        
        views.forEach { viewToAdd in
            view.addSubview(viewToAdd)
            viewToAdd.translatesAutoresizingMaskIntoConstraints = false
        }
        
        nameLabel.text = "Name"
        emailLabel.text = "Email Address"
        phoneLabel.text = "Phone Number"
        
        setFonts()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            nameLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            emailLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: padding),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            
            emailField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: padding),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            phoneLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: padding),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            
            phoneField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: padding),
            phoneField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            phoneField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
        ])
        
    }
    
    func configureFields () {
        nameField.placeholder = "e.g. Stephen King"
        emailField.placeholder = "e.g. stephenking@lorem.com"
        phoneField.placeholder = "e.g. +1 234 567 890"
        
        nameField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        emailField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        phoneField.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        
        nameField.text = nameValue
        emailField.text = emailValue
        phoneField.text = phoneValue
        
        nameField.borderStyle = .roundedRect
        emailField.borderStyle = .roundedRect
        phoneField.borderStyle = .roundedRect
        
        emailField.keyboardType = .emailAddress
        phoneField.keyboardType = .namePhonePad
    }
    
    func setFonts() {
        let formLabels = [nameLabel, emailLabel, phoneLabel]
        let textFields = [nameField, emailField, phoneField]
        
        formLabels.forEach { label in
            label.font = UIFont(name: "Ubuntu-Regular", size: 16)
            label.textColor = UIColor(named: "Marine Blue")
        }
        
        textFields.forEach { field in
            field.font = UIFont(name: "Ubuntu-Bold", size: 16)
            field.textColor = UIColor(named: "Cool-Gray")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        guard let text = sender.text else {return}
        
        switch sender {
        case nameField:
            self.nameValue = text

        case emailField:
            self.emailValue = text

        case phoneField:
            self.phoneValue = text

        default:
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("editing ens")
    }
    
}
