//
//  SettingsVM.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import Foundation
import Resolver

final class SettingsVM {
    enum SettingsVMError: LocalizedError {
        case invalidName

        var errorDescription: String? {
            switch self {
            case .invalidName:
                return "Selected name is invalid".localized
            }
        }
    }

    // MARK: - Public properties

    let user: Bindable<User?> = Bindable(nil)
    let errorResponse: Bindable<Error?> = Bindable(nil)

    // MARK: - Private properties

    @Injected private var _userRepository: UserRepository

    // MARK: - Initializers

    init() {
        try? user.value = _userRepository.getUser()
    }

    // MARK: - Public methods

    func createOrUpdateUser(with name: String?, successCompletion: (() -> Void)?) {
        guard let newName = name, !newName.isEmpty else {
            errorResponse.value = SettingsVMError.invalidName
            return
        }

        do {
            guard let user = user.value else {
                user.value = try _userRepository.create(name: newName)
                return
            }

            user.name = newName
            try _userRepository.update(object: user)
            successCompletion?()
        } catch {
            errorResponse.value = error
        }
    }

    // MARK: - Private methods
}
