//
//  Constants.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import Foundation
import SwiftUI
import Firebase

struct FirebaseConstants {
    
    static let UserCollection =  Firestore.firestore().collection(Constants.DB.User)
    static let MessagesCollection =  Firestore.firestore().collection(Constants.DB.Messages)
    
}

class Constants {

    struct ColorAsset {
        static let background = Color("backgroundColor")
        static let primaryTextColor = Color("primaryTextColor")
        static let textColor2 = Color("textColor2")
        static let placeHolderTextColor = Color("placeHolderTextColor")
        static let viewBackgroundLight = Color("viewBackgroundLight")
        static let primaryBlueColor = Color("primaryBlueColor")
    }
    
    struct AppConstants {
        static let AppName = "Chat App"
    }
    
    
    struct DB {
        static let User = "Users"
        static let Messages = "messages"
        static let RecentMessages = "recent-messages"
        static let Timestamp = "timeStamp"
        static let ProfileImage = "profile-images"
        static let ChatImages = "chat-images"
    }

}

extension Constants {
    
    struct Images {
        
        static let MessengerLogo = "messenger"
        static let facebookIcon = "facebook_icon"
    }
    
    struct DummyImages {
        static let sheldon_profile = "sheldon_profile"
    }
    
}

