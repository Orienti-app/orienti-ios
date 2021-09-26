//
//  Run.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class Run {
    let id: UUID
    let trackId: UUID
    let startedAt: Date
    let finishedAt: Date
    let runner: Runner
    let controlPoints: [ControlPointInstance]
    
    init(id: UUID, trackId: UUID, startedAt: Date, finishedAt: Date, runner: Runner, controlPoints: [ControlPointInstance]) {
        self.id = id
        self.trackId = trackId
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.runner = runner
        self.controlPoints = controlPoints
    }
}
