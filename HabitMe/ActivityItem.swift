//
//  Activity.swift
//  HabitMe
//
//  Created by Dmitry Sharabin on 27.11.2021.
//

import Foundation

struct ActivityItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
}
