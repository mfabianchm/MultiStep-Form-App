//
//  DescriptionLabel.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 13/05/24.
//

import UIKit

class DescriptionLabel: UILabel {

    var descriptionText: String?

    init(frame: CGRect, text: String) {
        super.init(frame: .zero)
        self.descriptionText = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.text = descriptionText
        self.numberOfLines = 2
        self.font = UIFont(name: "Ubuntu-Regular", size: 18)
        self.textColor = UIColor(named: "Cool-Gray")
    }

}
