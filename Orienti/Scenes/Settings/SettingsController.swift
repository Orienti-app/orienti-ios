//
//  SettingsController.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import ErrorHandler
import Resolver
import UIKit

final class SettingsController: UIViewController, HasCustomView {
    typealias CustomView = SettingsView

    // MARK: - Public properties

    // MARK: - Private properties

    @Injected var _viewModel: SettingsVM

    // MARK: - Initializers

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Public methods

    override func loadView() {
        view = SettingsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        _setupController()
    }

    // MARK: - Private methods

    private func _setupController() {
        navigationItem.title = "Settings".localized
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(_dismiss))

        customView.nameField.delegate = self
        customView.confirmButton.addTarget(self, action: #selector(_confirmButtonPressed(sender:)), for: .touchUpInside)

        // Setup notifications for keyboard
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        _bindUI()
    }

    private func _bindUI() {
        _viewModel.user.bindAndFire { [weak self] user in
            self?.customView.nameField.text = user?.name
        }

        _viewModel.errorResponse.bind { error in
            guard let error = error else { return }
            ErrorHandler.shared.handle(error)
        }
    }

    // MARK: - Objc methods

    @objc private func _dismiss() {
        dismiss(animated: true)
    }

    @objc private func _confirmButtonPressed(sender: UIButton) {
        _viewModel.createOrUpdateUser(with: customView.nameField.text, successCompletion: { [weak self] in
            self?._dismiss()
        })
    }
}

extension SettingsController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
