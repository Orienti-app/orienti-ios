//
//  VideoView.swift
//  Orienti
//
//  Created by Kryštof Kiss, designed by Ján Balažia on 02/12/2022.
//

import AVFoundation
import UIKit

final class VideoView: BaseView {
    // MARK: - Public properties
    
    var session: AVCaptureSession? {
        get {
            _cameraVideoLayer.session
        } set {
            _cameraVideoLayer.session = newValue
        }
    }

    // MARK: - Private properties

    private lazy var _cameraVideoLayer: AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer()
        layer.videoGravity = .resizeAspectFill
        
        return layer
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        _setupView()
        _layoutView()
    }
    
    // MARK: - Public methods

    override func layoutSubviews() {
        super.layoutSubviews()
        
        _cameraVideoLayer.frame = bounds
    }
    
    // MARK: - Private methods
    
    private func _setupView() {}
    
    private func _layoutView() {
        layer.addSublayer(_cameraVideoLayer)
    }
}
