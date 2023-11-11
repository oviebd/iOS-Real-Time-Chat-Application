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

@MainActor
class UserService {
    @Published var currentUser: User?
    static let shared = UserService()
    
    func signOutUser(){
        currentUser = nil
    }
    
    func fetchCurrentuser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        // "Ha1e5hLdyha7JDNIV3tr"
        let snapShot = try await Firestore.firestore().collection(Constants.DB.User).document(uid).getDocument()

        let user = try snapShot.data(as: User.self)
        currentUser = user
    }

    func fetchAllusers(limit: Int? = nil) async throws -> [User] {
        let query = FirebaseConstants.UserCollection
        if let limit = limit {
            query.limit(to: limit)
        }
        let snapShot = try await query.getDocuments()
        return snapShot.documents.compactMap({ try? $0.data(as: User.self) })
    }

    func fetchUser(withUid uid: String) async throws -> User {
        //  let query = FirebaseConstants.UserCollection.document(uid)
        let snapShot = try await FirebaseConstants.UserCollection.document(uid).getDocument()
        let user = try snapShot.data(as: User.self)
        return user
    }

//    static func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
//        FirebaseConstants.UserCollection.document(uid).getDocument { snapshot, _ in
//            guard let user = try? snapshot?.data(as: User.self) else { return }
//            completion(user)
//        }
    //  }

    func updateCurrentUser(imagePath: String) async throws {
        guard let uid = currentUser?.uuid else { return }
        var user = currentUser
        user?.profileImageUrl = imagePath
        guard let encodeUser = try? Firestore.Encoder().encode(user) else { return }
        try await FirebaseConstants.UserCollection.document(uid).setData(encodeUser)

        try await fetchCurrentuser()
    }
}
