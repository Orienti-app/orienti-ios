//
//  LabelContainer.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import UIKit

final class LabelContainer: BaseView {
    // MARK: - Public properties

    let subview: UIView
    
    // MARK: - Private properties

    private lazy var leftLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.textColor = Colors.black
        
        return label
    }()
    
    // MARK: - Initializers
    
    init(title: String, view: UIView) {
        subview = view
        super.init(frame: .zero)
        
        leftLabel.text = title
        
        _setupView()
        _layoutView()
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    private func _setupView() {}
    
    private func _layoutView() {
        addSubview(leftLabel)
        leftLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        addSubview(subview)
        subview.snp.makeConstraints { make in
            make.top.equalTo(leftLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
