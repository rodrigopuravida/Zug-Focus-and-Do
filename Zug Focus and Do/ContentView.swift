//
//  ContentView.swift
//  Zug Focus and Do
//
//  Created by Rodrigo Carballo on 6/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var habits = Habit.sampleHabits
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List(habits) { habit in
                VStack(alignment: .leading) {
                    HStack {
                        Text(habit.name)
                            .font(.headline)
                        Spacer()
                        Text("🔥 \(habit.streak)")
                            .font(.subheadline)
                            .foregroundColor(.orange)
                    }
                    HStack {
                        Text(habit.priority.rawValue.capitalized)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        if habit.isRecurring {
                            Image(systemName: "repeat")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                Button(action: {
                    showingAddHabit = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: $habits)
            }
        }
    }
}

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var habits: [Habit]
    
    @State private var habitName = ""
    @State private var priority = Habit.Priority.medium
    @State private var isRecurring = true
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Name", text: $habitName)
                
                Picker("Priority", selection: $priority) {
                    ForEach(Habit.Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue.capitalized)
                    }
                }
                
                Toggle("Daily Habit", isOn: $isRecurring)
            }
            .navigationTitle("New Habit")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Add") {
                    let newHabit = Habit(
                        name: habitName,
                        priority: priority,
                        dueDate: nil,
                        isCompleted: false,
                        isRecurring: isRecurring,
                        streak: 0
                    )
                    habits.append(newHabit)
                    dismiss()
                }
                .disabled(habitName.isEmpty)
            )
        }
    }
}

#Preview {
    ContentView()
}
