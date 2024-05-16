//
//  Models.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 08/05/24.
//

import Foundation

struct PersonalInfo {
    var name: String
    var email: String
    var phone: String
}

struct PlanChoosed {
    var planType: String
    var planPrice: Int
    var planName: String
}

struct PlanCard {
    var image: String
    var planName: String
    var price: Int
    var isMonthly: Bool
}

struct AddOn: Hashable {
    var nameAddOn: String
    var description: String
    var price: Int
}

struct AddOnChossed {
    var nameAddOn: String
    var description: String
    var price: Int
}

var user = PersonalInfo(name: "", email: "", phone: "")
var planChoosed = PlanChoosed(planType: "Monthly", planPrice: 9, planName: "Arcade")

let monthlyPlans: [PlanCard] = [
    PlanCard(image: "icon-arcade", planName: "Arcade", price: 9, isMonthly: true),
    PlanCard(image: "icon-advanced", planName: "Advanced", price: 12, isMonthly: true),
    PlanCard(image: "icon-pro", planName: "Pro", price: 15, isMonthly: true),
]

let yearlyPlans: [PlanCard] = [
    PlanCard(image: "icon-arcade", planName: "Arcade", price: 90, isMonthly: false),
    PlanCard(image: "icon-advanced", planName: "Advanced", price: 120, isMonthly: false),
    PlanCard(image: "icon-pro", planName: "Pro", price: 150, isMonthly: false),
]

let addOns: [AddOn] = [
    AddOn(nameAddOn: "Online service", description: "Access to multiplayer games", price: 1),
    AddOn(nameAddOn: "Larger storage", description: "Extra 1TB of cloud save", price: 2),
    AddOn(nameAddOn: "Customamizable profile", description: "Custom theme on your profile", price: 2)
]

let yearlyaddOns: [AddOn] = [
    AddOn(nameAddOn: "Online service", description: "Access to multiplayer games", price: 10),
    AddOn(nameAddOn: "Larger storage", description: "Extra 1TB of cloud save", price: 20),
    AddOn(nameAddOn: "Customamizable profile", description: "Custom theme on your profile", price: 20)
]

class AddOnsChossed {
    var addOnsChossed: Set<AddOn> = []
    
    func addOnsToArray(addOn: AddOn) {
        addOnsChossed.insert(addOn)
    }
    
}


