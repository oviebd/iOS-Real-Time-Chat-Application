//
//  UserService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 5/11/23.
//

import Foundation

import Firebase
import FirebaseFirestore
import Foundation

class UserService {
    
    @Published var currentUser : User?
    static let shared = UserService()

    @MainActor
    func fetchCurrentuser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        //"Ha1e5hLdyha7JDNIV3tr"
        let snapShot = try await Firestore.firestore().collection(Constants.DB.User).document(uid).getDocument()
        
        let user = try snapShot.data(as: User.self)
        self.currentUser = user
    }
    
   // @MainActor
    func fetchAllusers() async throws -> [User] {
      
        let snapShot = try await Firestore.firestore().collection(Constants.DB.User).getDocuments()
        return snapShot.documents.compactMap ( {try? $0.data(as: User.self) })
    }
}