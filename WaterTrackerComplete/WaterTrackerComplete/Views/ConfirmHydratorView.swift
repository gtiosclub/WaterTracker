//
//  ConfirmHydratorView.swift
//  WaterTrackerComplete
//
//  Created by Abdulaziz Albahar on 10/15/24.
//

import SwiftUI

struct ConfirmHydratorView: View {
    @Binding var waterTrackerVM: WaterTrackerViewModel
    @State var gramsInput = ""
    
    let hydrator: Hydrator
    
    var consumedWaterInGrams: Double {
        let grams = Double(gramsInput) ?? 0.0
        return hydrator.waterConsumed(for: grams)
    }
    var waterPercent: Double { hydrator.waterRatio*100 }

    var body: some View {
        Form {
            Section("Info") {
                infoRow(title: "Water %", value: "\(waterPercent)")
                infoRow(title: "Consumed water in grams", value: "\(consumedWaterInGrams)")
            }
            
            Section("Input") {
                TextField("Enter amount in grams", text: $gramsInput)
                    .keyboardType(.numberPad)
                    .onChange(of: gramsInput) { oldInput, newInput in
                        // Logic to only accept numbers
                        let nonNumbersCount = newInput.filter {
                            !($0.isNumber || $0 == ".")
                        }.count
                        let decimalsCount = newInput.filter { $0 == "." }.count
                        
                        // Cancel new input if not nvalid number
                        gramsInput = if decimalsCount > 1 || nonNumbersCount > 0 || newInput.first == "." {
                            oldInput
                        } else { newInput }
                    }
            }
            
            Button("Log", action: {
                waterTrackerVM.logHydrator(hydrator, amountInGrams: consumedWaterInGrams)
            })
        }

    }
    
    @ViewBuilder
    func infoRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .bold()
            Spacer()
            Text(value)
        }
    }
}

#Preview {
    ConfirmHydratorView(waterTrackerVM: .constant(.init()), hydrator: .apple)
}
