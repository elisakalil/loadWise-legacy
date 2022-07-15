//
//  PDFViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 14/06/22.
//

import Foundation
import UIKit

class PDFBuilderView: UIView {
    
    private let disjuntor: String
    private let conectionType: String
    private let residentialType: String
    private let appliances: [HomeApplianceModel]
    private let date: String
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "Declarção de carga simplificada"
        title.font = .boldSystemFont(ofSize: 23)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .brownIFSC
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var dateLabel: UILabel = {
        let title = UILabel()
        title.text = "Data: \(date)"
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var ucLabel: UILabel = {
        let title = UILabel()
        title.text = "Unidade Consumidora: "
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var cType: UILabel = {
        let title = UILabel()
        title.text = "Ligação: \(conectionType)"
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var disjuntorLabel: UILabel = {
        let title = UILabel()
        title.text = "Disjuntor: \(disjuntor)"
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var residentialTypeLabel: UILabel = {
        let title = UILabel()
        title.text = "Tipo: \(residentialType)"
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var appliancesTitleLabel: UILabel = {
        let title = UILabel()
        title.text = "Quantidade  |  Potência total  |  Aparelho"
        title.font = .boldSystemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var majorView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var appliancesStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.backgroundColor = .white
        stack.spacing = 20
        return stack
    }()
    
    init(appliances: [HomeApplianceModel],
         residentialType: String,
         disjuntor: String,
         conectionType: String,
         date: String
         )
    {
        self.appliances = appliances
        self.residentialType = residentialType
        self.disjuntor = disjuntor
        self.conectionType = conectionType
        self.date = date
        super.init(frame: .zero)
        backgroundColor = .white
        setup()
        buildSelectedAppliancesFodPDF()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(titleLabel)
        addSubview(majorView)
        addSubview(appliancesStack)
        
        majorView.addSubview(dateLabel)
        majorView.addSubview(ucLabel)
        majorView.addSubview(disjuntorLabel)
        majorView.addSubview(residentialTypeLabel)
        
        appliancesStack.addArrangedSubview(appliancesTitleLabel)
                
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            majorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            majorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            majorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            dateLabel.topAnchor.constraint(equalTo: majorView.topAnchor, constant: 16),
            dateLabel.trailingAnchor.constraint(equalTo: majorView.trailingAnchor, constant: -16),
            dateLabel.leadingAnchor.constraint(equalTo: majorView.leadingAnchor, constant: 16),

            ucLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            ucLabel.trailingAnchor.constraint(equalTo: majorView.trailingAnchor, constant: -16),
            ucLabel.leadingAnchor.constraint(equalTo: majorView.leadingAnchor, constant: 16),

            disjuntorLabel.topAnchor.constraint(equalTo: ucLabel.bottomAnchor, constant: 10),
            disjuntorLabel.trailingAnchor.constraint(equalTo: majorView.trailingAnchor, constant: -16),
            disjuntorLabel.leadingAnchor.constraint(equalTo: majorView.leadingAnchor, constant: 16),

            residentialTypeLabel.topAnchor.constraint(equalTo: disjuntorLabel.bottomAnchor, constant: 10),
            residentialTypeLabel.trailingAnchor.constraint(equalTo: majorView.trailingAnchor, constant: -16),
            residentialTypeLabel.leadingAnchor.constraint(equalTo: majorView.leadingAnchor, constant: 16),
            residentialTypeLabel.bottomAnchor.constraint(equalTo: majorView.bottomAnchor, constant: -16),
            
            appliancesStack.topAnchor.constraint(equalTo: majorView.bottomAnchor, constant: 34),
            appliancesStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            appliancesStack.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

extension PDFBuilderView {
    
    func buildSelectedAppliancesFodPDF() {
        for item in appliances {
            
            if item.quantity > 0 {
                
                let power = (item.quantity) * (item.power)
                
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = .systemFont(ofSize: 16)
                label.numberOfLines = 0
                label.textAlignment = .left
                label.textColor = .black
                
                label.text = "\(item.quantity)  \(power)W  \(item.name)"
                appliancesStack.addArrangedSubview(label)
            }
        }
    }
}
