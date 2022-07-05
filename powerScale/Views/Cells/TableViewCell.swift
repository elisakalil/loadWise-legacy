////
////  TableViewCell.swift
////  powerScale
////
////  Created by Elisa Kalil on 03/05/22.
////
//
//import UIKit
//

import UIKit

class TableViewCell: UITableViewCell {
        
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var homeApplianceName: UILabel = {
        let label = UILabel()
        label.textColor = .softBrownIFSC
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stepView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var step: UIStepper = {
        let step = UIStepper()
        step.minimumValue = 0
        step.maximumValue = 10
        step.stepValue = 1
        step.autorepeat = false
        step.tintColor = .green
        step.addTarget(self, action: #selector(stepValue), for: .valueChanged)
        return step
    }()
    
    private lazy var quantityView: UILabel = {
        let label = UILabel()
        label.textColor = .softBrownIFSC
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc func stepValue(sender: UIStepper) {
        print(sender.value)
        quantityView.text = String(Int(sender.value))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentView.backgroundColor = .softRoseIFSC

        contentView.addSubview(backView)
        backView.addSubview(homeApplianceName)
        backView.addSubview(quantityView)
        backView.addSubview(stepView)
        stepView.addSubview(step)
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            homeApplianceName.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 22),
            homeApplianceName.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            homeApplianceName.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),

            homeApplianceName.widthAnchor.constraint(equalToConstant: 190),
            
            quantityView.leadingAnchor.constraint(equalTo: homeApplianceName.trailingAnchor, constant: 10),
            quantityView.widthAnchor.constraint(equalToConstant: 25),
            quantityView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            quantityView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            
            stepView.leadingAnchor.constraint(equalTo: quantityView.trailingAnchor, constant: 5),
            stepView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stepView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -20),
            stepView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 22),
            
            step.leadingAnchor.constraint(equalTo: stepView.leadingAnchor),
            step.trailingAnchor.constraint(equalTo: stepView.trailingAnchor),
            step.centerYAnchor.constraint(equalTo: stepView.centerYAnchor),
            step.centerXAnchor.constraint(equalTo: stepView.centerXAnchor),
        ])
    }
}

