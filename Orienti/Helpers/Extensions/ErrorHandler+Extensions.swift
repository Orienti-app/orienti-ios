//
//  ErrorHandler+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 04/12/2022.
//

import ErrorHandler

extension ErrorHandler {
    static var shared: ErrorHandler {
        return ErrorHandler()
            .always { error in
                let title = error.localizedDescription
                AlertService.showAlert(title: title)
                return .stopMatching
            }
    }
}
