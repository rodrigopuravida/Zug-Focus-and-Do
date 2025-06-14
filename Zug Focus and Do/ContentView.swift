//
//  ContentView.swift
//  Zug Focus and Do
//
//  Created by Rodrigo Carballo on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tasks = Task.sampleTasks
    @State private var showingAddTask = false
    
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
            .toolbar {
                Button(action: {
                    showingAddTask = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(tasks: $tasks)
            }
        }
    }
}

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tasks: [Task]
    
    @State private var taskName = ""
    @State private var priority = Task.Priority.medium
    @State private var dueDate = Date()
    @State private var isRecurring = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $taskName)
                
                Picker("Priority", selection: $priority) {
                    ForEach(Task.Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue.capitalized)
                    }
                }
                
                Toggle("Recurring Task", isOn: $isRecurring)
                
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("New Task")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Add") {
                    let newTask = Task(
                        name: taskName,
                        priority: priority,
                        dueDate: dueDate,
                        isCompleted: false,
                        isRecurring: isRecurring
                    )
                    tasks.append(newTask)
                    dismiss()
                }
                .disabled(taskName.isEmpty)
            )
        }
    }
}

#Preview {
    ContentView()
}
