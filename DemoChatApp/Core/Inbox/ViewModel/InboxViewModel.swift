//
//  InboxViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 5/11/23.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var currentUser : User?
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}

