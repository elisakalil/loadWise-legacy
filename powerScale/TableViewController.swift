//
//  TableViewController.swift
//  powerScale
//
//  Created by Elisa Kalil on 03/05/22.
//

import Foundation
import UIKit

class TableViewController: UIViewController {
    
    private var cellIdentifier = "defaultCell"
    
    var appliances: [homeApplianceModel] = homeAppliances
    
    private lazy var optionsTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 90
        table.separatorStyle = .none
        table.backgroundColor = .white
        table.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.dataSource = self
        return table
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        button.isSelected = false
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .greenIFSC
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(pushFoward), for: .touchUpInside)
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildHierarchyandLayout()
        setupConstraints()
        setupNavigation()
        presentModal()
    }
    
    func presentModal() {
        let presentModal = ModalViewController()
        if let alertController = presentModal.presentationController as? UISheetPresentationController {
            alertController.detents = [.medium()]
        }
        self.present(presentModal, animated: true)
    }
    
    @objc private func pushFoward(button: UIButton) {
        button.isSelected = true
        button.setTitleColor(.black, for: .selected)
        self.navigationController?.pushViewController(FinalViewController(), animated: true)
        print("clique")
    }
    
    func buildHierarchyandLayout() {
        view.backgroundColor = .softRoseIFSC
        view.addSubview(optionsTableView)
        view.addSubview(sendButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            optionsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            optionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            optionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            
            sendButton.topAnchor.constraint(equalTo: optionsTableView.bottomAnchor, constant: 20),
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            sendButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            sendButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    private func setupNavigation() {
        self.navigationController?.navigationBar.isTranslucent = true
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appliances.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TableViewCell
        cell?.homeApplianceName.text = appliances[indexPath.row].appliance
        return cell ?? UITableViewCell()
    }
}
