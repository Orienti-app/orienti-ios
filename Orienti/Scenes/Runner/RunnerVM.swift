//
//  RunnerVM.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import AVFoundation
import QROrienti
import Resolver

final class RunnerVM: NSObject {
    // MARK: - Public properties

    let captureSession = AVCaptureSession()

    // MARK: - Private properties

    @Injected private var qrService: QRService

    // MARK: - Initializers

    override init() {
        super.init()
        guard let captureDevice = AVCaptureDevice.default(for: .video), let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)

        let metadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(metadataOutput)
        metadataOutput.setMetadataObjectsDelegate(self, queue: .main)
        metadataOutput.metadataObjectTypes = [.qr]
    }

    // MARK: - Public methods

    // MARK: - Private methods

    private func _handleQrValue(_ value: String) {
        guard let container = qrService.decode(content: value) else { return }

        switch container.type {
        case .run:
            break
        case .track:
            break
        case .controlPoint:
            break
        case .stop:
            break
        }
    }
}

extension RunnerVM: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            _handleQrValue(stringValue)
        }
    }
}
