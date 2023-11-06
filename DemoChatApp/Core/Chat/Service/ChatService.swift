//
//  ChatService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 6/11/23.
//

import Foundation
import Firebase

struct ChatService{
    
    let chatPartner : User
    
    let messageCollection = Firestore.firestore().collection(Constants.DB.Messages)

    func sendMessage(_ messageText: String) {
        guard let currentUuid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id

        let currenrUserRef = messageCollection.document(currentUuid).collection(chatPartnerId).document()
        let chatPartnerRef = messageCollection.document(chatPartnerId).collection(currentUuid)

        let messageId = currenrUserRef.documentID

        let message = Message(
            fromId: currentUuid,
            toId: chatPartnerId,
            messageText: messageText,
            timeStamp: Timestamp())

        guard let messageData = try? Firestore.Encoder().encode(message) else { return }

        currenrUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }

    func observeMessages(completion: @escaping ([Message]) -> Void) {
        guard let currentId = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id

        let query = messageCollection.document(currentId)
            .collection(chatPartnerId)
            .order(by: Constants.DB.Timestamp, descending: false)

        query.addSnapshotListener { snapshot, _ in

            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added
            }) else { return }

            var messages = changes.compactMap { try? $0.document.data(as: Message.self) }

            for (index, message) in messages.enumerated() where message.fromId != currentId {
                messages[index].user = chatPartner
            }

            completion(messages)
        }
    }
    
}
