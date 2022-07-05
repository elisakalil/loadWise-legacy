//
//  FinalViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 14/06/22.
//

import Foundation
import UIKit

class FinalViewController: UIViewController {
    
    private lazy var kw: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "0 kW"
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildHierarchyandLayout()
        setupConstraints()
        setupNavigation()
    }
    
    @objc private func pushFoward(button: UIButton) {
        button.isSelected = true
        button.setTitleColor(.black, for: .selected)
        if button == okButton {
            self.navigationController?.pushViewController(TableViewController(), animated: true)
        } else {
            self.navigationController?.pushViewController(PDFViewController(), animated: true)
        }
        print("clique")
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
}
