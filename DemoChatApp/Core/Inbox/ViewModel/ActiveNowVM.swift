//
//  ActiveNowVM.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 8/11/23.
//

import Foundation
import Firebase

@MainActor
class ActiveNowVM : ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task {try await fetchUsers()}
    }
    
    private func fetchUsers () async throws {
        guard let currentUserUid = Auth.auth().currentUser?.uid else {return}
        self.users = try await UserService().fetchAllusers(limit: 10)
        self.users = users.filter({  $0.id != currentUserUid })
    }
    
    
}
