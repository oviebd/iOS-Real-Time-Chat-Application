//
//  ChatMessageCell.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import SwiftUI

struct ChatMessageCell: View {
    let message: Message

    private var isFromCurrentUser: Bool {
        return message.isFromCurrenrUser
    }
    
    private var user : User? {
        return message.user
    }

    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Constants.ColorAsset.primaryBlueColor)
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: Utility.getScreenWidth() / 1.5, alignment: .trailing)
            } else {
                HStack(alignment: .bottom, spacing: 8.0) {
                    CircularProfileImageView(user: user, size: .xxSmall)

                    Text(message.messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Constants.ColorAsset.viewBackgroundLight)
                        .foregroundColor(Constants.ColorAsset.primaryTextColor)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: Utility.getScreenWidth() / 1.75, alignment: .leading)

                    Spacer()
                }
            }

        }.padding(.horizontal)
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageCell(message: Message.MockMessage)
    }
}
