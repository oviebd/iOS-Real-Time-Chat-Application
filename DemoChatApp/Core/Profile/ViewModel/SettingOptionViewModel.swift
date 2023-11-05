//
//  SettingOptionViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import Foundation
import SwiftUI

enum SettingOptionViewModel: Int, CaseIterable, Identifiable {
//    var id: ObjectIdentifier

    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notification

    var id: Int{
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .darkMode: return "Dark mode"
        case .activeStatus: return "Active status"
        case .accessibility: return "Accessibility"
        case .privacy: return "Privacy"
        case .notification: return "Notification"
        }
    }
    
    var imageName : String {
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notification: return "bell.circle.fill"
        }
    }
    
    var itemColor : Color {
        switch self {
        case .darkMode: return .black
        case .activeStatus: return Color(.systemGreen)
        case .accessibility: return .black
        case .privacy: return Constants.ColorAsset.primaryBlueColor
        case .notification: return Color(.systemPurple)
        }
    }
}
