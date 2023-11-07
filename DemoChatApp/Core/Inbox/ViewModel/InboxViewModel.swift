//
//  InboxViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 5/11/23.
//

import Combine
import Firebase
import Foundation

class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()

    private let inboxService = InboxService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
        inboxService.observeRecentMessages()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)

        inboxService.$documentChange.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }

    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap {
            try? $0.document.data(as: Message.self)
        }

        for i in 0 ..< messages.count {
            let message = messages[i]

            UserService.fetchUser(withUid: message.chatPartnerId) { [weak self] user in
                messages[i].user = user
                self?.recentMessages.append(messages[i])
            }
        }
    }
}
