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
    
    private lazy var step: UIStepper = {
        let step = UIStepper(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        step.center = contentView.center
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
        label.font = .boldSystemFont(ofSize: 20)
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
        backView.addSubview(step)
        backView.addSubview(quantityView)
        
        NSLayoutConstraint.activate([
            
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            homeApplianceName.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 22),
//            homeApplianceName.widthAnchor.constraint(equalToConstant: 210),
//            homeApplianceName.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -30),
            homeApplianceName.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            step.leadingAnchor.constraint(equalTo: homeApplianceName.trailingAnchor),
//            step.trailingAnchor.constraint(equalTo: quantityView.leadingAnchor),
//            step.widthAnchor.constraint(equalToConstant: 60),
//            step.heightAnchor.constraint(equalToConstant: 20),
            step.centerYAnchor.constraint(equalTo: backView.centerYAnchor),
            
            quantityView.leadingAnchor.constraint(equalTo: step.trailingAnchor),
            quantityView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            quantityView.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
}

