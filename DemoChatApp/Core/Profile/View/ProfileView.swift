//
//  ProfileView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import PhotosUI
import SwiftUI

struct ProfileView: View {

    @StateObject var profileVm = ProfileViewModel()
    @State var showImageChooser = false
    @State var showImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
   
    let user : User
    var body: some View {
        VStack {
            headerView

            List {
                Section {
                    menuItemHolder
                }

                Section {
                    Button("Lgout") {
                        AuthService.shared.signOut()
                    }

                    Button("Delete Account") {
                    }
                }
                .foregroundColor(Constants.ColorAsset.primaryBlueColor)
            }
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView( user: User.Mock_User)
    }
}

extension ProfileView {
    var headerView: some View {
        VStack {
            
            Button {
                showImageChooser.toggle()
            }label: {
                if let profileImage = profileVm.profileImage {
                    profileImage
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)

                } else {
                    
                    CircularProfileImageView(user: user, size: .xLarge)
                    
                }
            }
            
            
//            PhotosPicker(selection: $profileVm.selectedItem) {
//                if let profileImage = profileVm.profileImage {
//                    profileImage
//                        .resizable()
//                        .clipShape(Circle())
//                        .frame(width: 80, height: 80)
//
//                } else {
//
//                    CircularProfileImageView(user: user, size: .xLarge)
//
//                }
//            }

            Text(user.fullName)
                .foregroundColor(Constants.ColorAsset.primaryTextColor)
                .font(.title2)
                .fontWeight(.semibold)
        }.confirmationDialog("Select", isPresented: $showImageChooser) {
            
            Button("Camera") {
                showImagePicker = true
                sourceType = .camera
                //settingsConfig.sourceType = .camera
            }
            
            Button("Photo Library") {
                showImagePicker = true
                sourceType = .photoLibrary
            }
        }
        .sheet(isPresented: $showImagePicker) {
            CustomImagePicker(selectedImage:  $profileVm.selectedItem)
        }
    }

    var menuItemHolder: some View {
        ForEach(SettingOptionViewModel.allCases) {
            option in
            HStack {
                Image(systemName: option.imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(option.itemColor)
                Text(option.title)
                    .font(.subheadline)
            }
        }
    }
}
