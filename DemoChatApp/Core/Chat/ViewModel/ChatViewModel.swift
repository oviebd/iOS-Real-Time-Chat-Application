//
//  ChatViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import Foundation


class ChatViewModel : ObservableObject {
   
    @Published var chatText : String = ""
    @Published var messages = [Message]()

    let chatService : ChatService
    
    init(user: User) {
        chatService = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        chatService.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessages(){
        chatService.sendMessage(chatText)
    }
}
