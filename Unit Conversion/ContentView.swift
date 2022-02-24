//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Ethan Rayala on 2/24/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var inputUnit = "mL"
    @State private var outputUnit = "mL"
    
    
    let inputUnits = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    let outputUnits = ["mL", "Liters", "Cups", "Pints", "Gallons"]
    
    var convertedNum: Double {
        switch inputUnit {
            case "mL":
                switch outputUnit {
                    case "mL":
                        return inputValue
                    case "Liters":
                        return inputValue / 1000
                    case "Cups":
                        return inputValue / 240
                    case "Pints":
                        return inputValue / 473
                    case "Gallons":
                        return inputValue / 3785
                default:
                    return inputValue
                }
            case "Liters":
                switch outputUnit {
                    case "mL":
                        return inputValue * 1000
                    case "Liters":
                        return inputValue
                    case "Cups":
                        return inputValue * 4.167
                    case "Pints":
                        return inputValue * 2.11338
                    case "Gallons":
                        return inputValue / 3.785
                    default:
                        return inputValue
                }
            case "Cups":
                switch outputUnit {
                    case "mL":
                        return inputValue * 240
                    case "Liters":
                        return inputValue / 4.167
                    case "Cups":
                        return inputValue
                    case "Pints":
                        return inputValue / 1.972
                    case "Gallons":
                        return inputValue / 15.773
                    default:
                        return inputValue
                }
            case "Pints":
                switch outputUnit {
                    case "mL":
                        return inputValue * 473
                    case "Liters":
                        return inputValue / 2.113
                    case "Cups":
                        return inputValue * 1.97157
                    case "Pints":
                        return inputValue
                    case "Gallons":
                        return inputValue / 8
                    default:
                        return inputValue
                }
            case "Gallons":
                switch outputUnit {
                    case "mL":
                    return inputValue * 3785.41
                    case "Liters":
                    return inputValue * 3.78541
                    case "Cups":
                    return inputValue * 15.7725
                    case "Pints":
                        return inputValue * 8
                    case "Gallons":
                        return inputValue
                    default:
                        return inputValue
                }
            default:
                return inputValue
        }
    }
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Value and Unit")
                }
                
                Section {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                
                Section {
                    Text(convertedNum, format: .number)
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Volume Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

