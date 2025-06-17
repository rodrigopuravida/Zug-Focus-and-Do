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
}
