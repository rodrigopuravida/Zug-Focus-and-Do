import Foundation

struct Habit: Identifiable, Codable {
    let id = UUID()
    var name: String
    var priority: Priority
    var dueDate: Date?
    var isCompleted: Bool
    var isRecurring: Bool
    var streak: Int = 0
    
    enum Priority: String, Codable, CaseIterable {
        case low
        case medium
        case high
    }
    
    static func saveHabits(_ habits: [Habit]) {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: "SavedHabits")
        }
    }
    
    static func loadHabits() -> [Habit] {
        if let data = UserDefaults.standard.data(forKey: "SavedHabits"),
           let habits = try? JSONDecoder().decode([Habit].self, from: data) {
            return habits
        }
        return []
    }
}
