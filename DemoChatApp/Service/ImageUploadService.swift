//
//  ImageUploadService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 9/11/23.
//

import Firebase
import FirebaseStorage
import Foundation
import UIKit

enum ImageType {
    case ProfileIMage
    case Chat

    var imagePath: String {
        switch self {
        case .ProfileIMage:
            return Constants.DB.ProfileImage
        case .Chat:
            return Constants.DB.ChatImages
        }
    }

    var fileName: String {
        let extention = ".jpg"
        switch self {
        case .ProfileIMage:
            if let uid = Auth.auth().currentUser?.uid {
                return uid + extention
            }
            return NSUUID().uuidString + extention
        case .Chat:
            return NSUUID().uuidString + extention
        }
    }
}

class ImageUploadService {
    @MainActor
    func uploadImage(image: UIImage, imageType: ImageType) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }

        let filePath = "/" + imageType.imagePath + "/" + imageType.fileName

        let ref = Storage.storage().reference(withPath: filePath)
        _ = try await ref.putDataAsync(imageData)
        let downloadUrl = try await ref.downloadURL()

        return downloadUrl.absoluteString
    }
}
