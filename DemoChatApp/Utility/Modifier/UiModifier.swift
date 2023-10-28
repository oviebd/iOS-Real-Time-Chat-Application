//
//  UiModifier.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import Foundation
import SwiftUI

//struct RoundedBackgroundStroke : ViewModifier {
//    var inset: CGFloat = 0.5
//    var lineWidth = 1.0
//    var cornerRadius = 16.0
//
//    func body(content: Content) -> some View {
//        content
//            .background(
//                RoundedRectangle(cornerRadius: cornerRadius)
//                    .fill(Color.white)
//            )
//            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
//                .inset(by: inset)
//                .stroke(Color(hex: Constants.Colors.textFieldInvisibleStrokColor), lineWidth: lineWidth)
//            )
//    }
//}


//struct DefaultCircleOverlay: ViewModifier {
//    var inset: CGFloat = 0.5
//    var lineWidth = 1.0
//
//    func body(content: Content) -> some View {
//        content
//            .overlay(Circle()
//                .inset(by: inset)
//                .stroke(Color(hex: Constants.Colors.textFieldInvisibleStrokColor), lineWidth: lineWidth)
//            )
//    }
//}


struct DefaultRectangleBg : ViewModifier {
      
    var cornerRadius = 44.0
    var bgColor = Constants.ColorAsset.viewBackgroundLight
    
    func body(content: Content) -> some View {
        content
            .background(bgColor)
            .cornerRadius(cornerRadius)
            
    }
}


struct DefaultRectangleOverlay : ViewModifier {
    
    var inset: CGFloat = 0.5
    var lineWidth = 1.0
    var cornerRadius = 44.0
    var bgColor = Constants.ColorAsset.viewBackgroundLight
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(cornerRadius)
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: inset)
                .stroke(bgColor, lineWidth: lineWidth)
            )
    }
}

//struct DefaultCapsuleOverlay: ViewModifier {
//    var inset: CGFloat = 0.5
//    var lineWidth = 1.0
//    var cornerRadius = 44.0
//
//    func body(content: Content) -> some View {
//        content
//            .overlay(Capsule()
//                .inset(by: inset)
//                .stroke(Color(hex: Constants.Colors.textFieldInvisibleStrokColor), lineWidth: lineWidth)
//            )
//    }
//}
//
//struct DefaultDivider : ViewModifier {
//    var lineWidth = 1.0
//    var dividerColor = Constants.ColorAsset.secondaryTextColor
//
//    func body(content: Content) -> some View {
//        content
//            .frame(height: lineWidth)
//            .foregroundColor(dividerColor)
//    }
//}
