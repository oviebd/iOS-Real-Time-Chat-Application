//
//  InboxRowView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI

struct InboxRowView: View {
    
    let message : Message
    
    var user : User? {
        return message.user 
    }
    
    var body: some View {
        HStack(alignment: .top) {
            CircularProfileImageView(user: user, size: .medium)

            VStack(alignment: .leading, spacing: 5) {
               
                HStack {
                    Text(user?.fullName ?? "")
                        .foregroundColor(Constants.ColorAsset.primaryTextColor)
                        .fontWeight(.bold)

                    Spacer()

                    Text(message.timestampstring)
                        .foregroundColor(Constants.ColorAsset.textColor2)
                        .font(.footnote)

                    Image(systemName: "chevron.right")
                        .foregroundColor(Constants.ColorAsset.textColor2)
                        .font(.footnote)
                }

                Text(getMessageText())
                    .foregroundColor(Constants.ColorAsset.textColor2)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
        .frame(height: 72)
    }
    
    func getMessageText() -> String {
        if message.isFromCurrenrUser {
            return "you: " + message.messageText
        }
        return message.messageText
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView(message: Message.MockMessage)
    }
}
