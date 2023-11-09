//
//  ProfileViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import Firebase
import FirebaseFirestore
import PhotosUI
import SwiftUI

class ProfileViewModel: ObservableObject {
 
    let imageUploadService = ImageUploadService()
    var user : User
    
    @Published var profileImage: Image?
    @Published var selectedItem: UIImage? {
        didSet {
            Task { try await loadImage() }
            // Task {try await loadImage()}
        }
    }

    init(user : User) {
        self.user = user
    }
    
    @MainActor
    func loadImage() async throws {
        guard let image = selectedItem else { return }
        profileImage = Image(uiImage: image)

        let imagePath = try await imageUploadService.uploadImage(image: image, imageType: .ProfileIMage)

        guard let uid = user.uuid else { return }
        let user = User(fullName: user.fullName, email: user.email, profileImageUrl: imagePath)
        guard let encodeUser = try? Firestore.Encoder().encode(user) else { return }
        try await FirebaseConstants.UserCollection.document(uid).setData(encodeUser)

      
    }
}
