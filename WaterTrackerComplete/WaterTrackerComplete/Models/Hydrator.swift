//
//  Hydrator.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import Foundation

enum Hydrator: String, CaseIterable {
    case plainWater = "Plain Water", apple = "Apple", strawberries = "Strawberries", lettuce = "Lettuce", tea = "Tea"
    
    var waterRatio: Double {
        switch self {
        case .plainWater:
            1.0
        case .apple:
            0.86
        case .strawberries:
            0.91
        case .lettuce:
            0.96
        case .tea:
            0.98
        }
    }
    
    typealias Grams = Double
    
    func waterConsumed(for amountOfHydratorConsumed: Grams) -> Double {
        return self.waterRatio * amountOfHydratorConsumed
    }
}
