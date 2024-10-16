//
//  HydrationLog.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import Foundation

struct HydrationLog: Identifiable {
    let id = UUID()
    let date: Date = .now
    let hydrator: Hydrator
    let gramsConsumed: Double
    
    var waterInHydrator: Double {
        hydrator.waterConsumed(for: gramsConsumed)
    }
}
