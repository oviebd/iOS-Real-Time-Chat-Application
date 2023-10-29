//
//  CircularProfileImageView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import SwiftUI

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension : CGFloat {
        switch self {
            
        case .xxSmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    let user : User
    let size : ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profileImageUrl {
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .modifier(DefaultCircleOverlay(bgColor: Constants.ColorAsset.primaryBlueColor))
            
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundColor(Constants.ColorAsset.viewBackgroundLight)
        }
            
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.Mock_User, size: .large)
    }
}
