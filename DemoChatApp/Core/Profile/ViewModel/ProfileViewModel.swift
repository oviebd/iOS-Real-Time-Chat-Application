//
//  ProfileViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import SwiftUI
import PhotosUI

class ProfileViewModel : ObservableObject {
    @Published var selectedItem : UIImage?{
        didSet{
            loadImage()
            //Task {try await loadImage()}
        }
    }
    
    @Published var profileImage : Image?
    
    
    func loadImage() {
        guard let image = selectedItem else { return }
        profileImage = Image(uiImage: image)
    }
    
//    func loadImage() async throws {
//        guard let item = selectedItem else {return}
//        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
//        guard let uiImage = UIImage(data: imageData) else {return}
//        profileImage = Image(uiImage: uiImage)
//    }
    
}
