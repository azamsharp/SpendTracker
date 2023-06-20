//
//  String+Extensions.swift
//  SpendTracker
//
//  Created by Mohammad Azam on 6/20/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}
