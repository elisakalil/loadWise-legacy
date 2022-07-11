//
//  PDFViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 14/06/22.
//

import Foundation
import UIKit

protocol PDFBuilderProtocol {
    var residentialType: String? { get set }
}

class PDFBuilderViewController: UIViewController, PDFBuilderProtocol {
    
    var residentialType: String?
    lazy var date = Date()
    lazy var format = date.getFormattedDate(format: "dd/MM/yyyy")
    
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
        title.text = "Data: \(format)"
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
    
    private lazy var disjuntorLabel: UILabel = {
        let title = UILabel()
        title.text = "Disjuntor(Ampère): "
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
    
    private lazy var geladeira: UILabel = {
        let title = UILabel()
        title.text =  "Geladeira 1200W"
        title.font = .systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .left
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var fogao: UILabel = {
        let title = UILabel()
        title.text =  "Fogao 1200W"
        title.font = .systemFont(ofSize: 16)
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
    
    private lazy var infoStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var appliancesStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.spacing = 20
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        view.addSubview(titleLabel)
        view.addSubview(infoStack)
        
        infoStack.addSubview(majorView)
        infoStack.addSubview(appliancesStack)
        
        majorView.addSubview(dateLabel)
        majorView.addSubview(ucLabel)
        majorView.addSubview(disjuntorLabel)
        majorView.addSubview(residentialTypeLabel)
        
        appliancesStack.addSubview(fogao)
        appliancesStack.addSubview(geladeira)
  
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            infoStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            infoStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            infoStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            majorView.topAnchor.constraint(equalTo: infoStack.topAnchor),
            majorView.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            majorView.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),

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
            appliancesStack.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor),
            appliancesStack.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor),
            appliancesStack.bottomAnchor.constraint(equalTo: infoStack.bottomAnchor),
        ])
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension PDFBuilderProtocol {
    
}
