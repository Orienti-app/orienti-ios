//
//  QRController.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import Resolver
import UIKit

final class QRController: UIViewController, HasCustomView {
    typealias CustomView = QRView

    // MARK: - Public properties

    // MARK: - Private properties

    @Injected var _viewModel: QRVM

    // MARK: - Initializers

    // MARK: - Public methods

    override func loadView() {
        view = QRView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        _setupController()
    }

    // MARK: - Private methods

    private func _setupController() {}

    // MARK: - Objc methods
}
