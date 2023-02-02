//
//  ContentView.swift
//  WeSplit
//
//  Created by Yashraj jadhav on 01/01/23.
//
import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
  
    @FocusState private var amountIsFocused: Bool
  
    
    let tipPercentages = 0..<101
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        
        
        
        return amountPerPerson
    }
    
    var TotalAmmount : Double {
       // let tipSelection = Double(tipPercentage)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let totalamounforcheck = grandTotal
        
        return totalamounforcheck
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                   
                    Section {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                   
                    Section {
                        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD")).focused($amountIsFocused)
                    } header: {
                        Text("Amount Per Person").bold()
                    }
                    
                    Section {
                        Text(TotalAmmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).focused($amountIsFocused)
                    } header: {
                        Text( "total amount for the check ").bold().foregroundColor(tipPercentage == 0 ? Color.red : Color.primary)
                    }
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                            
                        }
                    }
                    
                }
               
            }
            .navigationTitle("WeSplit")
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
    }
}
