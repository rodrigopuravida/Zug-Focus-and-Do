//
//  ContentView.swift
//  Zug Focus and Do
//
//  Created by Rodrigo Carballo on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    let tasks = Task.sampleTasks
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.name)
                        .font(.headline)
                    HStack {
                        Text(task.priority.rawValue.capitalized)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        if let dueDate = task.dueDate {
                            Text(dueDate, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

#Preview {
    ContentView()
}
