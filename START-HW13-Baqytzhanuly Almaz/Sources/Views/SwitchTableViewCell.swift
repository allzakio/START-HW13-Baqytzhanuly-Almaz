//
//  SwitchTableViewCell.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 6/24/23.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    static let identifier = "SwitchTableViewCell"
    
//    MARK: - UI Elements
    
    private lazy var iconContainerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.addSubview(iconImageView)
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var settingSwitch: UISwitch = {
        let switcher =  UISwitch()
        switcher.onTintColor = .systemGreen
        switcher.sizeToFit()
        return switcher
    }()

//    MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Setups
    
    private func setupViews() {
        contentView.addSubview(iconContainerView)
        contentView.addSubview(title)
        contentView.addSubview(settingSwitch)
    }
    
    private func setupConstraints() {
        iconContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(iconContainerView.snp.trailing).offset(15)
            make.centerY.equalToSuperview()
        }
        
        settingSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
    }
    
//    MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconContainerView.backgroundColor = nil
        iconImageView.image = nil
        title.text = nil
        settingSwitch.isOn = false
    }
    
    public func configure(with model: SettingsSwitchOption) {
        iconContainerView.backgroundColor = model.iconBackgroundColor
        iconImageView.image = model.icon
        title.text = model.title
        settingSwitch.isOn = model.isOn
    }
}
