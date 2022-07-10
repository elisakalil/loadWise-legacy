//
//  ViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 02/05/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    private lazy var residentialButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Residencial", for: .normal)
        button.setTitleColor(.brownIFSC , for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(pushFoward), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 1
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bussinesButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Empresarial", for: .normal)
        button.setTitleColor(.brownIFSC , for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(pushFoward), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 12
        button.layer.shadowOpacity = 1
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [residentialButton, bussinesButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    private lazy var logo: UIImageView = {
        let celescLogo = UIImage(named: "Logo Celesc")
        let image = UIImageView(image: celescLogo )
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var pdf: PDFBuilderProtocol

    init(pdf: PDFBuilderProtocol) {
        self.pdf = pdf
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    @objc private func pushFoward(button: UIButton) {
        button.isSelected = true
        self.navigationController?.pushViewController(TableViewController(), animated: true)
        print("clique")
        sendResidentialTYpe(buttonType: button)
    }
    
    func sendResidentialTYpe(buttonType: UIButton) {
        if buttonType == residentialButton {
            pdf.residentialType = "Residencial"
            print(pdf.residentialType)
        } else {
            pdf.residentialType = "Empresarial"
            print(pdf.residentialType)

        }
    }
    
    private func setupLayout() {
        view.backgroundColor = UIColor(red: 238/255, green: 233/255, blue: 226/255, alpha: 1)
        view.addSubview(stack)
        view.addSubview(logo)
        
        NSLayoutConstraint.activate([

            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            bussinesButton.widthAnchor.constraint(equalToConstant: 320),
            bussinesButton.heightAnchor.constraint(equalToConstant: 70),

            residentialButton.widthAnchor.constraint(equalToConstant: 320),
            residentialButton.heightAnchor.constraint(equalToConstant: 70),
            
            logo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

