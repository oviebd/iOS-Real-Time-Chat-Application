//
//  CircularProfileImageView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import SwiftUI
import URLImage

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge

    var dimension: CGFloat {
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
    var user: User?
    let size: ProfileImageSize

    var body: some View {
        if let imageUrl = Utility.makeURL(path: user?.profileImageUrl) {
            URLImage(imageUrl) {
                EmptyView()
            } inProgress: { _ in

                ProgressView {
                }
                .frame(width: size.dimension, height: size.dimension)
                .zIndex(1)
            } failure: { _, _ in
                placeholderImage
            } content: { image in
                image
                    .resizable()
                  //  .scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.dimension, height: size.dimension)
                    .clipShape(Circle())
                    .modifier(DefaultCircleOverlay(bgColor: Constants.ColorAsset.primaryBlueColor))
            }

        } else {
            placeholderImage
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.Mock_User, size: .large)
    }
}

extension CircularProfileImageView {
    var placeholderImage: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: size.dimension, height: size.dimension)
            .clipShape(Circle())
            .foregroundColor(Constants.ColorAsset.viewBackgroundLight)
    }
}
