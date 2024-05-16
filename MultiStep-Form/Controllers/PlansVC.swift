//
//  PlansVC.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 07/05/24.
//

import UIKit

class PlansVC: UIViewController {

    let backgroundImage = UIImageView()
    let stepsStack = StepsStackView(step: 2)
    let plansModal = ModalPlansVC()
    let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    
    
    lazy var nextStepButton = UIBarButtonItem(title: "Next Step", style: .done, target: self, action: #selector(goToNextController))
    lazy var prevStepButton = UIBarButtonItem(title: "Go back", style: .done, target: self, action: #selector(goToPrevController))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Magnolia")
        configure()
    }
    
    func configure() {
        setToolbarItems([prevStepButton, flexButton, nextStepButton], animated: true)
        view.addSubview(backgroundImage)
        view.addSubview(stepsStack)
        
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "bg-sidebar-mobile")
        
        addVCChild()
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 210),
            
            stepsStack.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            stepsStack.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            stepsStack.widthAnchor.constraint(equalToConstant: 200),
            
            plansModal.view.topAnchor.constraint(equalTo: stepsStack.bottomAnchor, constant: 20),
            plansModal.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            plansModal.view.widthAnchor.constraint(equalToConstant: 350),
            plansModal.view.heightAnchor.constraint(equalToConstant: 550)
            
        ])
    }
    
    func addVCChild () {
        view.addSubview(plansModal.view)
        addChild(plansModal)
        plansModal.didMove(toParent: self)
    }
    
    func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func goToNextController() {
        if(plansModal.planIsSelected) {
            show(AddOnsVC(), sender: self)
        } else {
            showAlert(title: "Plan not selected", message: "Please, select your desired plan.")
        }
    }
    
    @objc func goToPrevController() {
        navigationController?.popViewController(animated: true)
    }

}
