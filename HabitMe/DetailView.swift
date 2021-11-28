//
//  DetailView.swift
//  HabitMe
//
//  Created by Dmitry Sharabin on 28.11.2021.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activities: Activities
    var activity: ActivityItem
    
    var completionText: String {
        let pluralization = activity.completionCount == 1 ? "time" : "times"
        
        return "You completed the activity \(activity.completionCount) \(pluralization)."
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                if activity.description.isEmpty {
                    Text("No description.")
                        .foregroundColor(.secondary)
                } else {
                    Text(activity.description)
                }
            }
            .padding(.bottom, 5)
            
            Divider()
            
            Text(completionText)
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Button {
                markAsDone()
            } label: {
                Label("Mark as done", systemImage: "checkmark.square")
            }
        }
        .padding()
        .navigationTitle(activity.title)
    }
    
    func markAsDone()  {
        guard let index = activities.items.firstIndex(where: { $0.id == activity.id }) else { return }
        
        let newActivity = ActivityItem(title: activity.title, description: activity.description, completionCount: activity.completionCount + 1)
        activities.items[index] = newActivity
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(activities: Activities(), activity: ActivityItem(title: "Activity title", description: "Activity description.", completionCount: 10))
        }
    }
}
