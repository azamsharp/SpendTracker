//
//  SpendTrackerApp.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 6/20/23.
//

import SwiftUI

@main
struct SpendTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                BudgetListScreen()
            }
        }
        .modelContainer(for: Budget.self)
    }
}
