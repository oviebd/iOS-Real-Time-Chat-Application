//
//  ChatMessageCell.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import SwiftUI

struct ChatMessageCell: View {
    
    let isFromCurrentUser : Bool
    let user : User
    var body: some View {
        
        HStack{
           
            if isFromCurrentUser {
                Spacer()
                Text("Test Message From Me..Test Message From Me..Test Message From Me..Test Message From Me..")
                    .font(.subheadline)
                    .padding(12)
                    .background(Constants.ColorAsset.primaryBlueColor)
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: Utility.getScreenWidth()/1.5, alignment: .trailing)
            }else{
                
                CircularProfileImageView(user: user, size: .xxSmall)
                
                Text("Test Message From Other..Test Message From Other..Test Message From Other..Test Message From Other..")
                    .font(.subheadline)
                    .padding(12)
                    .background(Constants.ColorAsset.viewBackgroundLight)
                    .foregroundColor(Constants.ColorAsset.primaryTextColor)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: Utility.getScreenWidth()/1.75, alignment: .trailing)
                
                Spacer()
            }
           
        }.padding(.horizontal)
        
        
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageCell(isFromCurrentUser: false, user: User.Mock_User)
    }
}
