//
//  RunnerView.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

final class RunnerView: BaseView {
    // MARK: - Public properties

    var cameraVideoView: VideoView = .init()

    lazy var checkpointsTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    // MARK: - Private properties

    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        
        _setupView()
        _layoutView()
    }
    
    // MARK: - Public methods

    // MARK: - Private methods
    
    private func _setupView() {
        backgroundColor = Colors.white
    }
    
    private func _layoutView() {
        addSubview(cameraVideoView)
        cameraVideoView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(snp.width)
        }
        
        addSubview(checkpointsTable)
        checkpointsTable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(cameraVideoView.snp.bottom)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
