//
//  ViewController.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 6/23/23.
//

import UIKit
import SnapKit

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case basicCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let rightLabel: String?
    let rightLabelBackgroundColor: UIColor?
    let handler: (() -> Void)
}

class ViewController: UIViewController {
    
    private var models = [Section]()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupCells()
    }
    
//    MARK: - Setups
    
    private func setupViews() {
        title = "Настройки"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.trailing.bottom.leading.equalTo(view)
        }
    }
    
    private func setupCells() {
        models.append(Section(options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                print("Нажата ячейка Авиарежим")
            }, isOn: true)),
            .basicCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, rightLabel: "Не подключено", rightLabelBackgroundColor: .systemGray) {
                print("Нажата ячейка Wi-Fi")
            }),
            .basicCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackgroundColor: .systemBlue, rightLabel: "Вкл.", rightLabelBackgroundColor: .systemGray) {
                print("Нажата ячейка Bluetooth")
            }),
            .basicCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Сотовый связь")
            }),
            .basicCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Режим модема")
            }),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue, handler: {
                print("Нажата ячейка VPN")
            }, isOn: true))
        ]))
        
        models.append(Section(options: [
            .basicCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "bell.circle.fill"), iconBackgroundColor: .systemRed, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Уведомления")
            }),
            .basicCell(model: SettingsOption(title: "Звуки, тактильные сигнали", icon: UIImage(systemName: "speaker.wave.2.circle.fill"), iconBackgroundColor: .systemPink, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Звуки, тактильные сигнали")
            }),
            .basicCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.circle.fill"), iconBackgroundColor: .systemPurple, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Не беспокоить")
            }),
            .basicCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass.circle.fill"), iconBackgroundColor: .systemPurple, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Экранное время")
            })
        ]))
        
        models.append(Section(options: [
            .basicCell(model: SettingsOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .lightGray, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Основные")
            }),
            .basicCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "list.bullet.circle.fill"), iconBackgroundColor: .lightGray, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Пункт управления")
            }),
            .basicCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "a.circle.fill"), iconBackgroundColor: .systemBlue, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Экран и яркость")
            }),
            .basicCell(model: SettingsOption(title: "Экран «Домой»", icon: UIImage(systemName: "circle.grid.3x3.circle.fill"), iconBackgroundColor: .blue, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Экран «Домой»")
            }),
            .basicCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "person.crop.circle.fill"), iconBackgroundColor: .systemBlue, rightLabel: nil, rightLabelBackgroundColor: nil) {
                print("Нажата ячейка Универсальный доступ")
            })
        ]))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
