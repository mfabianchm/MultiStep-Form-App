//
//  TitleLabel.swift
//  MultiStep-Form
//
//  Created by Marcos Fabian Chong Megchun on 13/05/24.
//

import UIKit

class TitleLabel: UILabel {
    
    var titleText: String?

    init(frame: CGRect, text: String) {
        super.init(frame: .zero)
        self.titleText = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.text = titleText
        self.font = UIFont(name: "Ubuntu-Bold", size: 30)
        self.textColor = UIColor(named: "Marine Blue")
    }

}
