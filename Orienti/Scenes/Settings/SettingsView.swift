//
//  SettingsView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import UIKit

final class SettingsView: BaseView {
    // MARK: - Public properties

    lazy var nameField: BaseField = {
        let textField = BaseField()
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        return textField
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        
        Styles.actionButton.apply(to: button)
        button.configuration?.image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))
        button.configuration?.title = "Confirm".localized
        
        return button
    }()
    
    // MARK: - Private properties

    private var _nameContainer: LabelContainer?
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        _setupView()
        _layoutView()
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func _setupView() {
        backgroundColor = .white
        
        _nameContainer = LabelContainer(title: "Your name".localized.uppercased(), view: nameField)
    }
    
    private func _layoutView() {
        addSubview(_nameContainer!)
        _nameContainer?.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(25)
        }
        
        addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
