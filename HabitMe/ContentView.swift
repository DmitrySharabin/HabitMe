//
//  ContentView.swift
//  HabitMe
//
//  Created by Dmitry Sharabin on 27.11.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { activity in
                    NavigationLink {
                        DetailView(activities: activities, activity: activity)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(activity.title)
                                .font(.headline)
                            
                            Text(activity.description)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("HabitMe")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button {
                        showingAddActivity = true
                    } label: {
                        Label("Add activity", systemImage: "plus")
                    }
                }
                
                ToolbarItemGroup {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
