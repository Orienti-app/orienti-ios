//
//  RoleView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

final class RoleView: BaseView {
    // MARK: - Public properties

    lazy var runnerButton: UIButton = {
        let button = UIButton()
        
        Styles.actionButton.apply(to: button)
        button.configuration?.image = UIImage(systemName: "figure.run")
        button.configuration?.title = "Runner".localized
        
        return button
    }()
    
    lazy var trainerButton: UIButton = {
        let button = UIButton()
        
        Styles.actionButton.apply(to: button)
        button.configuration?.image = UIImage(named: "whistle")
        button.configuration?.title = "Trainer".localized
        
        return button
    }()
    
    // MARK: - Private properties

    private lazy var _hStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 20
        
        return view
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        _setupView()
        _layoutView()
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func _setupView() {
        backgroundColor = Colors.white
    }
    
    private func _layoutView() {
        addSubview(_hStackView)
        
        _hStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(1.5)
        }
        
        _hStackView.addArrangedSubviews([runnerButton, trainerButton])
    }
}
