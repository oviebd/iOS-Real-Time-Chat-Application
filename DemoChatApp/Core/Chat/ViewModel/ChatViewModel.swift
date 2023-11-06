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
    
    let user : User
    
    init(user: User) {
        self.user = user
        observeMessages()
    }
    
    func observeMessages() {
        MessageService.observeMessages(chatPartner: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessages(){
        MessageService.sendMessage(chatText, toUser: user)
    }
}
