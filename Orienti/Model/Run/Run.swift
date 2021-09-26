//
//  Run.swift
//  Orienti
//
//  Created by Kryštof Kiss on 26/09/2021.
//

import Foundation

class Run {
    let id: UUID
    let routeId: UUID
    let startedAt: Date
    let finishedAt: Date
    let runner: Runner
    let controlPoints: [ControlPointInstance]
    
    init(id: UUID, routeId: UUID, startedAt: Date, finishedAt: Date, runner: Runner, controlPoints: [ControlPointInstance]) {
        self.id = id
        self.routeId = routeId
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.runner = runner
        self.controlPoints = controlPoints
    }
}
