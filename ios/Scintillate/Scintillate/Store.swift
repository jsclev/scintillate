import Foundation
import Combine

class Store: ObservableObject {
    @Published var userViewModel: UserViewModel
    @Published var workListViewModel: WorkListViewModel
    
    let db: Db
    
    // Deal with SwiftUI update problems
//    private var anyCancellableUserViewModel: AnyCancellable? = nil
//    private var anyCancellableWorkListViewModel: AnyCancellable? = nil

    init(db: Db) {
        self.db = db
        
        let workList = WorkList(works: self.db.work.getHugoWinnersOnly())
        userViewModel = UserViewModel(user: self.db.user.getCurrentUser(), workList: workList)
        workListViewModel = WorkListViewModel(workList)

        // Deal with SwiftUI update problems
//        anyCancellableUserViewModel = userViewModel.objectWillChange.sink { [weak self] _ in
//            self?.objectWillChange.send()
//        }
//
//        anyCancellableWorkListViewModel = workListViewModel.objectWillChange.sink { [weak self] _ in
//            self?.objectWillChange.send()
//        }
    }
}

extension ObservableObject where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
  func registerNestedObservableObject<Object: ObservableObject>(_ vm: Object, cancellables: inout [AnyCancellable]) {
    cancellables.append(
      vm.objectWillChange.sink { [weak self] _ in
        self?.objectWillChange.send()
      }
    )
  }
  func registerNestedObservableObject<Object: ObservableObject>(_ vm: Object, cancellable: inout AnyCancellable?) {
    cancellable = vm.objectWillChange.sink { [weak self] _ in
      self?.objectWillChange.send()
    }
  }
}
