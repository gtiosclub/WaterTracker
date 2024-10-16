//
//  LandingView.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import SwiftUI

struct LandingView: View {
    @State var waterTrackerVM = WaterTrackerViewModel()
    
    var body: some View {
        NavigationStack(path: $waterTrackerVM.navigationPath) {
                
            VStack(spacing: 30) {
                Button("Consumption History", action: {
                    waterTrackerVM.navigate(to: .consumptionHistory)
                })
                .buttonStyle(BorderedButtonStyle())
                
                Button("Add hydrator", action: {
                    waterTrackerVM.navigate(to: .addHydrator)
                })
                .buttonStyle(BorderedButtonStyle())
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Screen.self, destination: { screen in
                switch screen {
                case .addHydrator:
                    AddHydratorView(waterTrackerVM: $waterTrackerVM)
                        .navigationTitle("Select Hydrator")
                        .navigationBarTitleDisplayMode(.inline)
                case .consumptionHistory:
                    ConsumptionHistoryView(waterTrackerVM: $waterTrackerVM)
                        .navigationTitle("Consumption History")
                        .navigationBarTitleDisplayMode(.inline)
                }
            })
            
        }
        
    }
}

#Preview {
    LandingView()
}
