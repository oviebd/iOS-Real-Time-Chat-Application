//
//  AlertViewModifier.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 31/10/23.
//

import SwiftUI

// struct DefaultAlertModifier: ViewModifier {
//    @Binding var isLoading: Bool
//
//    func body(content: Content) -> some View {
//        if isLoading {
//            content
//                .overlay {
//                    ProgressView()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//                        .scaleEffect(2)
//                        .zIndex(1)
//                        .frame(maxWidth: .infinity)
//                    // .background(Constants.ColorAsset.viewBackgroundLight)
//                }
//        } else {
//            content
//        }
//    }
// }

struct DefaultAlertModifier: ViewModifier {
    @Binding var isLoading: Bool
    var isCancelable: Bool = false
    var cancelAction: (() -> Void)?

    func body(content: Content) -> some View {
        if isLoading {
            content
                .overlay {
                    VStack {
                        Spacer()

                        ProgressView()
                            .frame(width: 50, height: 50, alignment: .center)
                            .scaleEffect(2)
                            .tint(.white)

                        if isCancelable {
                            Button {
                                isLoading = false
                                if let action = cancelAction {
                                    action()
                                }
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.white)
                            }
                            .padding(.top, 20)
                        }

                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0, green: 0, blue: 0, opacity: 0.8))
                }
        } else {
            content
        }
    }
}
