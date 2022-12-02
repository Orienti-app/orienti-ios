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

    private func _setupController() {
        navigationItem.title = "Trainer".localized
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem?.menu = UIMenu(children: [
            UIAction(title: "New run".localized) { _ in

            },
            UIAction(title: "Change name".localized) { _ in

            },
            UIAction(title: "Change mode".localized) { _ in
                AppCoordinator.startSelectMode()
            }
        ])
    }

    // MARK: - Objc methods
}
