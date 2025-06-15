import Foundation

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var priority: Priority
    var dueDate: Date?
    var isCompleted: Bool
    var isRecurring: Bool
    var streak: Int = 0
    
    enum Priority: String, CaseIterable {
        case low
        case medium
        case high
    }
    
    static let sampleHabits = [
        Habit(name: "Morning Meditation", priority: .high, dueDate: nil, isCompleted: true, isRecurring: true, streak: 5),
        Habit(name: "Read 30 minutes", priority: .medium, dueDate: nil, isCompleted: false, isRecurring: true, streak: 3),
        Habit(name: "Drink Water", priority: .high, dueDate: nil, isCompleted: false, isRecurring: true, streak: 7),
        Habit(name: "Evening Walk", priority: .medium, dueDate: nil, isCompleted: false, isRecurring: true, streak: 2),
        Habit(name: "Journal", priority: .low, dueDate: nil, isCompleted: false, isRecurring: true, streak: 1)
    ]
}
