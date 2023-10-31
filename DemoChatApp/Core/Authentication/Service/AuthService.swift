//
//  AuthService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 31/10/23.
//

import Foundation
import Firebase

class AuthService {
    func login(withEmail email: String, password: String) async throws {
    }

    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("U>> Created User \(result.user.uid)")
        }catch{
            print("U>> Failed to create User -- \(error.localizedDescription)")
        }
    }
}
