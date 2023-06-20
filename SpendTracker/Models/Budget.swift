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
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
}
