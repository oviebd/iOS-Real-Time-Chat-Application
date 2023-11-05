//
//  AuthService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 31/10/23.
//

import Foundation
import Firebase
import FirebaseFirestore

class AuthService {
    
    @Published var userSession : FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        loadCurrentUserData()
        
      //  print("U>> userSession id is \(self.userSession?.uid)")
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        }catch{
            print("U>> Failed to Login E -- \(error.localizedDescription)")
        }
    }

    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploaduserData(email: email, fullName: fullName, id: result.user.uid)
            loadCurrentUserData()
            print("U>> Created User \(result.user.uid)")
        }catch{
            print("U>> Failed to create User -- \(error.localizedDescription)")
        }
    }
    
    
    func signOut () {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil 
        }catch{
            print("U>> failed to signOut \(error.localizedDescription)")
        }
    }
    
    private func uploaduserData(email : String, fullName : String , id : String ) async throws {
        
        let user = User(fullName: fullName, email: email, profileImageUrl: nil)
        guard let encodeUser = try? Firestore.Encoder().encode(user) else {return}
        
        try await Firestore.firestore().collection("Users").document(id).setData(encodeUser)
        
    }
    
    private func loadCurrentUserData(){
        Task{try await UserService.shared.fetchCurrentuser()}
    }
}
