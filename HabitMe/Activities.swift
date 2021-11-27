//
//  Activities.swift
//  HabitMe
//
//  Created by Dmitry Sharabin on 27.11.2021.
//

import Foundation

class Activities: ObservableObject {
    private let key = "Habits"
    
    @Published var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: key) {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
