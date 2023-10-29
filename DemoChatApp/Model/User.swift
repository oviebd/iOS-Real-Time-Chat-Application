//
//  User.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import Foundation

struct User : Codable,Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName : String
    let email : String
    let profileImageUrl : String?
}

extension User {
    static let Mock_User = User(fullName: "Test user", email: "test@gmail.com", profileImageUrl: Constants.DummyImages.sheldon_profile)
}
