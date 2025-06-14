import Foundation

struct Task: Identifiable {
    let id = UUID()
    var name: String
    var priority: Priority
    var dueDate: Date?
    var isCompleted: Bool
    var isRecurring: Bool
    
    enum Priority: String, CaseIterable {
        case low
        case medium
        case high
    }
    
    static let sampleTasks = [
        Task(name: "Buy groceries", priority: .high, dueDate: Date().addingTimeInterval(86400), isCompleted: false, isRecurring: false),
        Task(name: "Morning workout", priority: .medium, dueDate: nil, isCompleted: true, isRecurring: true),
        Task(name: "Read a book", priority: .low, dueDate: Date().addingTimeInterval(172800), isCompleted: false, isRecurring: false),
        Task(name: "Call mom", priority: .high, dueDate: Date().addingTimeInterval(43200), isCompleted: false, isRecurring: false),
        Task(name: "Meditate", priority: .medium, dueDate: nil, isCompleted: false, isRecurring: true)
    ]
} 