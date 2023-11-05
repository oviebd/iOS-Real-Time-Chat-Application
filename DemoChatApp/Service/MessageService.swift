//
//  MessageService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 5/11/23.
//

import Firebase
import Foundation

struct MessageService {
    static let messageCollection = Firestore.firestore().collection(Constants.DB.Messages)

    static func sendMessage(_ messageText: String, toUser user: User) {
        guard let currentUuid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = user.id

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
}
