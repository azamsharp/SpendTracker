//
//  BudgetListScreen.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 6/20/23.
//

import SwiftUI
import SwiftData

struct BudgetListScreen: View {
    
    @Query private var budgets: [Budget]
    @Environment(\.modelContext) private var context
    
    @State private var name: String = ""
    @State private var limit: Double? = nil
    
    private var isFormValid: Bool {
        !name.isEmptyOrWhiteSpace && limit != nil
    }
    
    private func saveBudget() {
        let budget = Budget(name: name, limit: limit!)
        context.insert(budget)
    }
    
    var body: some View {
        Form {
            Section("New Budget") {
                TextField("Name", text: $name)
                TextField("Limit", value: $limit, format: .number)
                    //.keyboardType(.numberPad)
                Button("Clear") {
                    limit = nil
                }
                Button("Save") {
                    //saveBudget()
                    //name = ""
                    limit = nil
                }.disabled(!isFormValid)
            }
            
            Section("Budgets") {
                List(budgets) { budget in
                    HStack {
                        Text(budget.name)
                        Spacer()
                        Text(budget.limit, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
            }
            
        }.navigationTitle("SpendTracker")
    }
}

#Preview {
    NavigationStack {
        BudgetListScreen()
            .modelContainer(for: Budget.self)
    }
}
