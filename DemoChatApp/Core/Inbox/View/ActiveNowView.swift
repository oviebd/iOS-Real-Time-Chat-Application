//
//  ActiveNowView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import SwiftUI

struct ActiveNowView: View {
    let user : User
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                
                ForEach(0 ... 10, id: \.self) { _ in
                    VStack(spacing: 2) {
                        ZStack(alignment: .bottom) {
                           
                            CircularProfileImageView(user: user, size: .medium)

                            ZStack(alignment: .center) {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.white)

                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.green)
                            }.offset(x: 30, y: -10)
                        }

                        Text("Name")
                            .font(.subheadline)
                            .foregroundColor(Constants.ColorAsset.placeHolderTextColor)
                    }
                }
            }
        }.frame(height: 90)
    }
}

struct ActiveNowView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveNowView(user: User.Mock_User)
    }
}
