//
//  BudgetDetailScreen.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 6/20/23.
//

import SwiftUI
import SwiftData

struct BudgetDetailScreen: View {
    
    let budget: Budget
    
    @State private var note: String = ""
    @State private var amount: Double?
    @State private var date: Date = Date()
    @State private var hasReceipt: Bool = false
    
    private func saveTransaction() {
        let transaction = Transaction(note: note, amount: amount!, date: date, hasReceipt: hasReceipt)
        // belongsTo to relationship
        transaction.budget = budget
        // hasMany relationship
        budget.addTransaction(transaction)
    }
    
    private var isFormValid: Bool {
        !note.isEmptyOrWhiteSpace && amount != nil
    }
    
    var body: some View {
        Form {
            Section("New Transaction") {
                TextField("Note", text: $note)
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.numberPad)
                DatePicker("Date", selection: $date)
                Toggle("Receipt", isOn: $hasReceipt)
                Button("Save Transaction") {
                    saveTransaction()
                }.disabled(!isFormValid)
            }
            Section("Transactions") {
                List(budget.transactions) { transaction in
                    HStack {
                        Text(transaction.note)
                        Spacer()
                        Text(transaction.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
            }
        }.navigationTitle(budget.name)
    }
}

/*
#Preview {
    BudgetDetailScreen()
} */
