//
//  RunnerController.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import Resolver
import UIKit

final class RunnerController: UIViewController, HasCustomView {
    typealias CustomView = RunnerView

    // MARK: - Public properties

    // MARK: - Private properties

    @Injected private var _viewModel: RunnerVM

    // MARK: - Initializers

    // MARK: - Public methods

    override func loadView() {
        view = RunnerView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        _setupController()
    }

    // MARK: - Private methods

    private func _setupController() {}

    // MARK: - Objc methods
}
