import Foundation

struct Work: Equatable, Hashable {
    let id: Int
    let title: String
    let authors: [Author]
    let awards: [Award]
    
    func getAuthorText() -> String {
        if authors.count > 0 {
            return authors.map{$0.getName()}.joined(separator: ", ")
        }
        
        return ""
    }
    
    func getAwardText() -> String {
        if awards.count > 0 {
            return awards.map{$0.getName()}.joined(separator: ", ")
        }
        
        return ""
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
