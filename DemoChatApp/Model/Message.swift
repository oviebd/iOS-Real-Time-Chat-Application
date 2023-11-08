//
//  Message.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 5/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable{
    
    @DocumentID var messageId : String?
    let fromId : String
    let toId : String
    let messageText : String
    let timeStamp : Timestamp
    var user: User?
    
    var id : String{
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId : String{
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrenrUser : Bool{
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampstring : String{
        return timeStamp.dateValue().timestampString()
    }
}

extension Message {

    static let MockMessage = Message(fromId: User.Mock_User.id, toId: "", messageText: "Test Mesage", timeStamp: Timestamp())
}
