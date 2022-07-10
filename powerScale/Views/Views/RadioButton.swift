//
//  RadioButton.swift
//  powerScale
//
//  Created by Elisa Kalil on 05/05/22.
//

import Foundation
import UIKit

class RadioButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            setImage(getRightIcon(), for: .normal)
        }
    }
    
    func getRightIcon() -> UIImage? {
        let imageName = isSelected ? "Ellipse on" : ""
        return UIImage(named: imageName)
    }
}
