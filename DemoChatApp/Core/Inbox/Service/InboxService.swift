//
//  InboxService.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 7/11/23.
//

import Foundation
import Firebase

class InboxService {
    
    @Published var documentChange = [DocumentChange]()
    
    func observeRecentMessages() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let query = FirebaseConstants.MessagesCollection
            .document(uid)
            .collection(Constants.DB.RecentMessages)
            .order(by: Constants.DB.Timestamp, descending: true)
        
        query.addSnapshotListener { snapShot, _ in
            guard let changes = snapShot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            })else {return}
            
            self.documentChange = changes
        }
    }
    
}
