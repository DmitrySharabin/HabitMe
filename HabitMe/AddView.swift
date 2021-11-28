//
//  AddView.swift
//  HabitMe
//
//  Created by Dmitry Sharabin on 27.11.2021.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("New Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Add") {
                        let item = ActivityItem(title: trimmedTitle, description: description.trimmingCharacters(in: .whitespaces))
                        
                        activities.items.append(item)
                        
                        dismiss()
                    }
                    .disabled(trimmedTitle.isEmpty)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
