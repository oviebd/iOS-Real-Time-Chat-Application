//
//  ChatView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var chatVm = ChatViewModel()
    let user : User
    
    var body: some View {
        
        VStack{

            ScrollView{
                
                CircularProfileImageView(user: user, size: .xLarge)
                
                Text(user.fullName)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Constants.ColorAsset.primaryTextColor)
                Text("Messenger")
                    .font(.footnote)
                    .foregroundColor(Constants.ColorAsset.textColor2)
                
                
                ForEach(0 ... 15, id: \.self){ message in
                    ChatMessageCell(isFromCurrentUser: Bool.random(), user: user)
                    
                }

            }
            
            Spacer()
            sendView.padding()
            
        }
        
      
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: User.Mock_User)
    }
}

extension ChatView {
    
    var sendView : some View {
        
        ZStack(alignment: .trailing){
            
            InputTextWithBG(text: $chatVm.chatText, placeHolderText: "Write")
                .padding(.trailing,55)
         
            Button{
                
            }label: {
                Text("Send")
                    .padding(10)
                    .background(Constants.ColorAsset.primaryBlueColor)
                    .foregroundColor(.white)
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .modifier(DefaultRectangleBg(cornerRadius: 5))
            }
            
            
        }
        
    }
    
}