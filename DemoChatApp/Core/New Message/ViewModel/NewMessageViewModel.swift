//
//  NewMessageViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI
import Foundation
import Firebase

@MainActor
class NewMessageViewModel : ObservableObject {
    
    @Published var toText : String = ""
    
    @Published var users = [User]()
    
    init(){
        Task{try await fetchUsers()}
    }

    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let users = try await UserService().fetchAllusers()
        self.users = users.filter( {$0.id != currentUid})
    }
    
}
