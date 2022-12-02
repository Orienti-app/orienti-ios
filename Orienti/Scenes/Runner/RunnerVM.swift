//
//  RunnerVM.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import AVFoundation

final class RunnerVM {
    // MARK: - Public properties

    let captureSession = AVCaptureSession()

    // MARK: - Private properties

    // MARK: - Initializers

    init() {
        guard let captureDevice = AVCaptureDevice.default(for: .video), let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
    }

    // MARK: - Public methods

    // MARK: - Private methods
}
