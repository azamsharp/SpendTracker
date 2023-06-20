//
//  Budget.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 6/20/23.
//

import Foundation
import SwiftData

@Model
final class Budget {
    
    var name: String
    var limit: Double
    
    @Relationship(.cascade)
    var transactions: [Transaction] = []
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
    func addTransaction(_ transaction: Transaction) {
        // add your business logic
        self.transactions.append(transaction)
    }
    
}
