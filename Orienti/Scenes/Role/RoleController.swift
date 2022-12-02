//
//  RoleController.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

final class RoleController: UIViewController, HasCustomView {
    typealias CustomView = RoleView

    // MARK: - Public properties

    // MARK: - Private properties

    // MARK: - Initializers

    // MARK: - Public methods

    override func loadView() {
        view = RoleView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        _setupController()
    }

    // MARK: - Private methods

    private func _setupController() {
        customView.runnerButton.addTarget(self, action: #selector(runnerButtonPressed(sender:)), for: .touchUpInside)
        customView.trainerButton.addTarget(self, action: #selector(trainerButtonPressed(sender:)), for: .touchUpInside)
    }

    // MARK: - Objc methods

    @objc private func runnerButtonPressed(sender: UIButton) {
        AppCoordinator.startRunnerMode()
    }

    @objc private func trainerButtonPressed(sender: UIButton) {
        AppCoordinator.startTrainerMode()
    }
}
