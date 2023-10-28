//
//  FontModifier.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import Foundation
import SwiftUI


struct normalFont : ViewModifier {
    var fontSize: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
}
