//
//  SettingsView.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 7/13/23.
//

import UIKit

class SettingsView: UIView {
    private var models = [Section]()
    
//    MARK: - Configurations
    func configureView(with models: [Section]) {
        self.models = models
    }
    
//    MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
//    MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Setups
    
    private func commonInit() {
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.trailing.bottom.leading.equalToSuperview()
        }
    }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .basicCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath
            ) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .basicCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}
