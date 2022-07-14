//
//  FinalViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 14/06/22.
//

import Foundation
import UIKit

class FinalViewController: UIViewController {
    
    private var totalSelectedPower: Int
    private var disjuntor: String = "40 Ampères"
    private var conectionType: String = "Monofásica"
    private let residentialType: String
    private let appliances: [HomeApplianceModel]
    
    
    private lazy var kw: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "\(totalSelectedPower/1000) kW"
        text.font = UIFont.boldSystemFont(ofSize: 40.0)
        text.numberOfLines = 0
        text.textAlignment = .center
        text.textColor = .brownIFSC
        return text
    }()
    
    private lazy var totalPower: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "de carga total instalada"
        text.font = UIFont(name: "Sen-Bold", size: 10)
        text.numberOfLines = 0
        text.textAlignment = .center
        text.textColor = .brownIFSC
        return text
    }()
    
    private lazy var information: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Faltam 3 kW para alcançar o valor máximo de proteção junto à CELESC"
        text.font = UIFont(name: "Sen-Bold", size: 10)
        text.numberOfLines = 0
        text.textAlignment = .center
        text.textColor = .brownIFSC
        text.isHidden = true
        return text
    }()
    
    private lazy var okButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .greenIFSC
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(pushFoward), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .grayIFSC
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(pushFoward), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [okButton, sendButton])
        stack.axis = .horizontal
        stack.spacing = 15
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    init(appliances: [HomeApplianceModel],
         totalSelectedPower: Int,
         residentialType: String,
         nibName: String?,
         bundle: Bundle?)
    {
        self.appliances = appliances
        self.totalSelectedPower = totalSelectedPower
        self.residentialType = residentialType
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildHierarchyandLayout()
        setupConstraints()
        setupNavigation()
        setup()
    }
    
    @objc private func pushFoward(button: UIButton) {
        button.isSelected = true
        button.setTitleColor(.black, for: .selected)
        if button == okButton {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.navigationController?.pushViewController(PDFBuilderViewController(appliances: appliances,
                                                                                   residentialType: residentialType,
                                                                                   disjuntor: disjuntor,
                                                                                   conectionType: "Monofásica",
                                                                                   nibName: nil,
                                                                                   bundle: nil),
                                                                                   animated: true)
        }
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func buildHierarchyandLayout() {
        view.backgroundColor = .softRoseIFSC
        view.addSubview(kw)
        view.addSubview(totalPower)
        view.addSubview(information)
        view.addSubview(stack)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            kw.topAnchor.constraint(equalTo: view.topAnchor, constant: 320),
            kw.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            kw.widthAnchor.constraint(equalToConstant: 300),
            
            totalPower.topAnchor.constraint(equalTo: kw.bottomAnchor, constant: 10),
            totalPower.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalPower.widthAnchor.constraint(equalToConstant: 300),
            totalPower.heightAnchor.constraint(equalToConstant: 70),
            
            information.topAnchor.constraint(equalTo: totalPower.bottomAnchor, constant: 70),
            information.widthAnchor.constraint(equalToConstant: 270),
            information.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            okButton.widthAnchor.constraint(equalToConstant: 160),
            okButton.heightAnchor.constraint(equalToConstant: 54),
            
            sendButton.widthAnchor.constraint(equalToConstant: 160),
            sendButton.heightAnchor.constraint(equalToConstant: 54),
            
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ])
    }
    
    func setup() {
        
        if  totalSelectedPower > 0 && totalSelectedPower < 8000  {
            let missingPower = 12000 - totalSelectedPower
            information.text = "Faltam \(missingPower/1000) kW para alcançar o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "40 Ampères"
            conectionType = "Monofásica"
            
        } else if totalSelectedPower > 8000 && totalSelectedPower < 12000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.textColor = .greenIFSC
            information.isHidden = false
            
            disjuntor = "50 Ampères"
            conectionType = "Monofásica"
            
        } else if totalSelectedPower > 12000 && totalSelectedPower < 13000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "63 Ampères"
            conectionType = "Monofásica"
            
        } else if totalSelectedPower > 13000 && totalSelectedPower < 15000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "70 Ampères"
            conectionType = "Monofásica"
            
            
        ///MARK: Trifásico
            
        } else if totalSelectedPower > 25000 && totalSelectedPower < 30000 {
            let missingPower = 38000 - totalSelectedPower
            information.text = "Faltam \(missingPower/1000) kW para alcançar o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "40 Ampères"
            conectionType = "Trifásica"
        } else if totalSelectedPower > 30000 && totalSelectedPower < 35000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "50 Ampères"
            conectionType = "Trifásica"
            
        } else if totalSelectedPower > 35000 && totalSelectedPower < 45000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "63 Ampères"
            conectionType = "Trifásica"
            
        } else if totalSelectedPower > 45000 && totalSelectedPower < 50000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "70 Ampères"
            conectionType = "Trifásica"
            
        } else if totalSelectedPower > 50000 && totalSelectedPower < 60000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "90 Ampères"
            conectionType = "Trifásica"
            //ADD MODAL
            
        } else if totalSelectedPower > 60000 && totalSelectedPower < 70000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "100 Ampères"
            conectionType = "Trifásica"
            
        } else if totalSelectedPower > 70000 && totalSelectedPower < 75000 {
            information.text = "Você atingiu o valor máximo de proteção junto à CELESC"
            information.isHidden = false
            
            disjuntor = "125 Ampères"
            conectionType = "Trifásica"
    }
    
    }
}
