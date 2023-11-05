//
//  ContentViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 4/11/23.
//



import Firebase
import Combine


class ContentViewModel : ObservableObject {
    
    @Published var userSession : FirebaseAuth.User?
    
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
  
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
            
        }
        .store(in: &cancellable)
        
    }
    
}
