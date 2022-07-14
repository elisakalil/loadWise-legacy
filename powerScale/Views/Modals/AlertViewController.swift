//
//  AlertViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 14/07/22.
//

import Foundation
import UIKit

class AlertViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "ATENÇÃO"
        text.font = UIFont.boldSystemFont(ofSize: 40.0)
        text.numberOfLines = 0
        text.textAlignment = .left
        text.textColor = .red
        return text
    }()
    
    private lazy var informationLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Para ligação trifásica com carga instalada acima de 65, deverá ser justificada a necessidade por meio do cálculo da demanda e apresentado documento de responsabilidade técnica por profissional habilitado via sistema PEP (Projeto Elétrico de Particulares - tipo de solicitação BT - Ligação Nova ou Aumento de Carga sem Análise de Projetos). Deve ser acessado pelo profissional habilitado."
        text.font = UIFont(name: "Sen-Bold", size: 20)
        text.numberOfLines = 0
        text.textAlignment = .left
        text.textColor = .black
        return text
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Ok", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .greenIFSC
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        buildHierarchyandLayout()
        setupConstraints()
    }
    
    @objc private func dismiss(button: UIButton) {
        button.isSelected = true
        self.dismiss(animated: true)
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func buildHierarchyandLayout() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(informationLabel)
        view.addSubview(sendButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            informationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            informationLabel.widthAnchor.constraint(equalToConstant: 300),
            
            sendButton.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 76),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sendButton.widthAnchor.constraint(equalToConstant: 350),
            sendButton.heightAnchor.constraint(equalToConstant: 54)
    ])
    }
}
