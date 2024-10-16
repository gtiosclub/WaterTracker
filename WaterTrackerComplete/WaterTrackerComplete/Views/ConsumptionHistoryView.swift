//
//  ConsumptionHistoryView.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import SwiftUI

struct ConsumptionHistoryView: View {
    @Binding var waterTrackerVM: WaterTrackerViewModel

    var body: some View {
        List(waterTrackerVM.hydrationLogs, id: \.id) { log in
            VStack {
                HStack {
                    Text(log.hydrator.rawValue)
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.blue)
                    Spacer()
                    Text( "\(log.gramsConsumed) grams" )
                }
             
                Text(log.date.formatted())
            }
        }
    }
}

#Preview {
    ConsumptionHistoryView(waterTrackerVM: .constant(.init()))
}
