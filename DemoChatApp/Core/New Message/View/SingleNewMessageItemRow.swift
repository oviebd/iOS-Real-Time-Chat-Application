//
//  SingleNewMessageItemRow.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI

struct SingleNewMessageItemRow: View {
    
    let user : User
    
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(user: user, size: .small)

                Text("Name")
                    .foregroundColor(Constants.ColorAsset.primaryTextColor)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }

            Divider()
                .padding(.leading, 40)
        }
    }
}

struct SingleNewMessageItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleNewMessageItemRow(user: User.Mock_User)
    }
}
