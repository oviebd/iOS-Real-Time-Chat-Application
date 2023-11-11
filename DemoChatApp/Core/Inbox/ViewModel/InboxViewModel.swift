//
//  InboxViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 5/11/23.
//

import Combine
import Firebase
import Foundation

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()

    private let inboxService = InboxService()
    private let userService = UserService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscribers()
        inboxService.observeRecentMessages()
    }

    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }
        .store(in: &cancellables)

        inboxService.$documentChange.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes, isInitial: self?.recentMessages.count ?? 0 <= 0)
        }.store(in: &cancellables)
    }

    private func loadInitialMessages(fromChanges changes: [DocumentChange], isInitial: Bool) {
        var messages = changes.compactMap {
            try? $0.document.data(as: Message.self)
        }

        var isWithUser: [String: User] = [:]

        Task {
            isWithUser = try await prepareMessageData(recentMessages: messages)

            for i in 0 ..< messages.count {
                let message = messages[i]
                recentMessages = self.recentMessages.filter({ $0.user?.id != message.chatPartnerId })
                messages[i].user = isWithUser[message.chatPartnerId]

                if isInitial {
                    self.recentMessages.append(messages[i])
                } else {
                    self.recentMessages.insert(messages[i], at: 0)
                }
            }
        }
    }

    func prepareMessageData(recentMessages: [Message]) async throws -> [String: User] {
        var idWithUser: [String: User] = [:]

        try await withThrowingTaskGroup(of: (String, User).self, body: { group in

            for message in recentMessages {
                group.addTask {
                    (message.chatPartnerId, try await self.userService.fetchUser(withUid: message.chatPartnerId))
                }
            }

            for try await (messageId, user) in group {
                idWithUser[messageId] = user
            }
        })
        return idWithUser
    }
}
