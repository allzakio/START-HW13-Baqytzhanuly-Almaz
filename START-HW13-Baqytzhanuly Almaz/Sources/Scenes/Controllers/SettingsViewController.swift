//
//  ViewController.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 6/23/23.
//

import UIKit
import SnapKit

class SettingsViewController: UIViewController {
    
    private var models: SectionModel?
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        models = SectionModel()
        view = SettingsView()
        configureView()
    }
}

private extension SettingsViewController {
    func configureView() {
        guard let models = models?.createModels() else { return }
        settingsView?.configureView(with: models)
    }
}
