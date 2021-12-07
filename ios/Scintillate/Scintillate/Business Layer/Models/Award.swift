import Foundation

struct Award: Equatable, Hashable {
    let id: Int
    let type: String
    let name: String
    let year: Int
    let status: String
    
    func getName() -> String {
        return String(year) + " " + type + " " + status + " " + name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
