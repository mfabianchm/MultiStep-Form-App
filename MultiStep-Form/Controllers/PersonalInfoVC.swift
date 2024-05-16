//
//  PersonalInfoVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 07/05/24.
//

import UIKit

class PersonalInfoVC: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let personalInfoModal = ModalPersonalInfoVC()
    let backgroundImage = UIImageView()
    let stepsStack = StepsStackView(step: 1)
    let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    lazy var toolbarbtn01 = UIBarButtonItem(title: "Next Step", style: .done, target: self, action: #selector(goToNextController))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Magnolia")
        configure()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func configure() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: 400, height: 2300)
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setToolbarItems([flexButton,toolbarbtn01], animated: true)
        contentView.addSubview(backgroundImage)
        contentView.addSubview(stepsStack)
        
        contentView.addSubview(personalInfoModal.view)
        addChild(personalInfoModal)
        personalInfoModal.didMove(toParent: self)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "bg-sidebar-mobile")
        
        personalInfoModal.view.layer.zPosition = 40
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 700),
            
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 210),
            
            stepsStack.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            stepsStack.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            stepsStack.widthAnchor.constraint(equalToConstant: 200),

            personalInfoModal.view.topAnchor.constraint(equalTo: stepsStack.bottomAnchor, constant: 20),
            personalInfoModal.view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            personalInfoModal.view.widthAnchor.constraint(equalToConstant: 350),
            personalInfoModal.view.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func saveUserInfo() {
        print(personalInfoModal.nameValue)
        user.name = personalInfoModal.nameValue
        user.email = personalInfoModal.emailValue
        user.phone = personalInfoModal.phoneValue
    }
    
    func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func valuesAreOk () -> Bool {
        
        if(personalInfoModal.nameValue == "" || personalInfoModal.emailValue == "" || personalInfoModal.phoneValue == "") {
            return false
        }
        
        let nameHasInt = checkForInt(text: personalInfoModal.nameValue)
        let emailIsValid = isValidEmail(personalInfoModal.emailValue)
        let phoneIsValid = isValidPhoneNumber(phone: personalInfoModal.phoneValue)
        
        if(!nameHasInt && emailIsValid && phoneIsValid) {
            return true
        }
        
        return  false
        
    }
    
    func checkForInt(text: String) -> Bool {
        let decimalCharacters = CharacterSet.decimalDigits
        let decimalRange = text.rangeOfCharacter(from: decimalCharacters)

        if decimalRange != nil {
            return true
        }
        return false
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    func isValidPhoneNumber(phone: String) -> Bool {
            let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

            let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
            return phoneCheck.evaluate(with: phone)
    }
    
   
    
    @objc func goToNextController() {
        saveUserInfo()
        let formIsOk = valuesAreOk()
        if(formIsOk) {
            show(PlansVC(), sender: self)
        } else {
            showAlert(title: "Fields not ok", message: "Please fill fields with correct values!")
        }
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }


        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset

    }

}


