//
//  TrainerView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

final class TrainerView: BaseView {
    // MARK: - Public properties

    // MARK: - Private properties

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
    
    private func _layoutView() {}
}
