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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        DispatchQueue.global(qos: .background).async {
            self._viewModel.captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        _viewModel.captureSession.stopRunning()
    }

    // MARK: - Private methods

    private func _setupController() {
        navigationItem.title = "Runner".localized

        customView.cameraVideoView.session = _viewModel.captureSession

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
