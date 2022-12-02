//
//  TrainerController.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import Resolver
import UIKit

final class TrainerController: UIViewController, HasCustomView {
    typealias CustomView = TrainerView

    // MARK: - Public properties

    // MARK: - Private properties

    @Injected private var _viewModel: TrainerVM

    // MARK: - Initializers

    // MARK: - Public methods

    override func loadView() {
        view = TrainerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        _setupController()
    }

    // MARK: - Private methods

    private func _setupController() {}

    // MARK: - Objc methods
}
