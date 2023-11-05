//
//  ChatViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 29/10/23.
//

import Foundation


class ChatViewModel : ObservableObject {
    @Published var chatText : String = ""
    
    let user : User
    
    init(user: User) {
        self.user = user
    }
    
    func sendMessages(){
        MessageService.sendMessage(chatText, toUser: user)
    }
}
