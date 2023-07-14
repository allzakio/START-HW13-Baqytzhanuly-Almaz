//
//  SectionModel.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 7/11/23.
//

import Foundation
import UIKit

enum SettingsOptionType {
    case basicCell(model: BasicOption)
    case switchCell(model: SwitchOption)
}

struct Section {
    let options: [SettingsOptionType]
}

final class SectionModel {
    func createModels() -> [Section] {
        let result =  [
            Section(options: [
                .switchCell(model: SwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                    print("Нажата ячейка Авиарежим")
                }, isOn: true)),
                .basicCell(model: BasicOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue, rightLabel: "Не подключено", rightLabelBackgroundColor: .systemGray) {
                    print("Нажата ячейка Wi-Fi")
                }),
                .basicCell(model: BasicOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackgroundColor: .systemBlue, rightLabel: "Вкл.", rightLabelBackgroundColor: .systemGray) {
                    print("Нажата ячейка Bluetooth")
                }),
                .basicCell(model: BasicOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Сотовый связь")
                }),
                .basicCell(model: BasicOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Режим модема")
                }),
                .switchCell(model: SwitchOption(title: "VPN", icon: UIImage(systemName: "globe"), iconBackgroundColor: .systemBlue, handler: {
                    print("Нажата ячейка VPN")
                }, isOn: true))
            ]),
            Section(options: [
                .basicCell(model: BasicOption(title: "Уведомления", icon: UIImage(systemName: "bell.circle.fill"), iconBackgroundColor: .systemRed, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Уведомления")
                }),
                .basicCell(model: BasicOption(title: "Звуки, тактильные сигнали", icon: UIImage(systemName: "speaker.wave.2.circle.fill"), iconBackgroundColor: .systemPink, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Звуки, тактильные сигнали")
                }),
                .basicCell(model: BasicOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.circle.fill"), iconBackgroundColor: .systemPurple, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Не беспокоить")
                }),
                .basicCell(model: BasicOption(title: "Экранное время", icon: UIImage(systemName: "hourglass.circle.fill"), iconBackgroundColor: .systemPurple, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Экранное время")
                })
            ]),
            Section(options: [
                .basicCell(model: BasicOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .lightGray, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Основные")
                }),
                .basicCell(model: BasicOption(title: "Пункт управления", icon: UIImage(systemName: "list.bullet.circle.fill"), iconBackgroundColor: .lightGray, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Пункт управления")
                }),
                .basicCell(model: BasicOption(title: "Экран и яркость", icon: UIImage(systemName: "a.circle.fill"), iconBackgroundColor: .systemBlue, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Экран и яркость")
                }),
                .basicCell(model: BasicOption(title: "Экран «Домой»", icon: UIImage(systemName: "circle.grid.3x3.circle.fill"), iconBackgroundColor: .blue, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Экран «Домой»")
                }),
                .basicCell(model: BasicOption(title: "Универсальный доступ", icon: UIImage(systemName: "person.crop.circle.fill"), iconBackgroundColor: .systemBlue, rightLabel: nil, rightLabelBackgroundColor: nil) {
                    print("Нажата ячейка Универсальный доступ")
                })
            ])
        ]
        return result
    }
}

