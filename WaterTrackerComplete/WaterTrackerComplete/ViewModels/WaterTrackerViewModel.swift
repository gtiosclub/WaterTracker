//
//  WaterTrackerViewModel.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import SwiftUI

@Observable
class WaterTrackerViewModel {
    var hydrationLogs: [HydrationLog] = []
    
    var navigationPath = NavigationPath()
    
    func logHydrator(_ hydrator: Hydrator, amountInGrams: Double) {
        let log = HydrationLog(hydrator: hydrator, gramsConsumed: amountInGrams)
        hydrationLogs.append(log)
        
        navigationPath.removeLast()
    }
    
    func navigate(to screen: Screen) {
        navigationPath.append(screen)
    }
}
