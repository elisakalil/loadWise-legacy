//
//  PDFViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 14/06/22.
//

import Foundation
import UIKit

class PDFViewController: UIViewController {
    
    let totalPower: Int = 0

    let totalApliances: [String] = [
        "Aquecedor portátil de ambiente",
        "Cafeteira elétrica de uso doméstico",
        "Grelha (Gill)"
    ]

//    var total: PDFeModel = PDFeModel(appliances: totalApliances, totalPower: totalPower)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
