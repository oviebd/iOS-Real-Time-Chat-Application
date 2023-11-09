//
//  ImageUploadService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 9/11/23.
//

import FirebaseStorage
import Foundation
import UIKit
import Firebase


enum ImageType {
  
    case ProfileIMage
    case Chat
    
    var imagePath : String {
        switch self{
            
        case .ProfileIMage:
            return Constants.DB.ProfileImage
        case .Chat:
            return Constants.DB.ChatImages
        }
    }
}

class ImageUploadService {
  
    @MainActor
    func uploadImage(image: UIImage, imageType : ImageType) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }

        let fileName = NSUUID().uuidString + ".jpg"
        let filePath = "/" +  imageType.imagePath + "/" + fileName
       
        let ref =  Storage.storage().reference(withPath: filePath)
        _ = try await ref.putDataAsync(imageData)
        let downloadUrl = try await ref.downloadURL()
  
        return downloadUrl.absoluteString
    }
}
