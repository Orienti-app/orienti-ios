//
//  BaseField.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import UIKit

class BaseField: UITextField {
    // MARK: - Public properties

    var fieldFont: UIFont? = UIFont(name: "HelveticaNeue-Regular", size: 16) {
        didSet {
            font = fieldFont
        }
    }

    var insets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    // MARK: - Private properties
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        _setupView()
        _layoutView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    // MARK: - Private methods
    
    private func _setupView() {
        font = fieldFont
        borderStyle = .none
        backgroundColor = .white
        textColor = Colors.black
        tintColor = Colors.black
        
        layer.borderColor = Colors.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    }
    
    private func _layoutView() {}
}
