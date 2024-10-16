//
//  AddHydratorView.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import SwiftUI

struct AddHydratorView: View {
    @Binding var waterTrackerVM: WaterTrackerViewModel
    
    let food: [Hydrator] = [.apple, .lettuce, .strawberries]
    let beverages: [Hydrator] = [.tea, .plainWater]
    
    var body: some View {
        Form {
            Section("Food") {
                ForEach(food, id: \.rawValue) { foodItem in
                    row(item: foodItem)
                }
            }

            Section("Beverages") {
                ForEach(beverages, id: \.rawValue) { beverage in
                    row(item: beverage)
                }
            }
        }
    }
    
    @ViewBuilder
    func row(item: Hydrator) -> some View {
        let destination = ConfirmHydratorView(waterTrackerVM: $waterTrackerVM, hydrator: item)
            .navigationTitle("Confirm Log")
        
        NavigationLink(
            destination: destination,
            label: {
                Text(item.rawValue)
            }
        )
    }
}

#Preview {
    AddHydratorView(waterTrackerVM: .constant(.init()))
}
