//
//  User.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uuid: String?
    var id: String {
        return uuid ?? NSUUID().uuidString
    }

    let fullName: String
    let email: String
    let profileImageUrl: String?
    
    var firstName : String{
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName
    }
}

extension User {
    static let Mock_User = User(fullName: "Test user", email: "test@gmail.com", profileImageUrl: Constants.DummyImages.sheldon_profile)
}
