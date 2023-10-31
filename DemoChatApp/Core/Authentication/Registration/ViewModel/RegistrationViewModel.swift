//
//  RegistrationViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import Foundation

class RegistrationViewModel :  ObservableObject {
  
    @Published var emailInputText : String = ""
    @Published var passwordInputText : String = ""
    @Published var fullNameInputText : String = ""
    
    //Common Data
    @Published var isLoading : Bool = false
    @Published var showAlert : Bool = false
    @Published var alertMessage : String = ""
    
    func createUser() async throws {
        isLoading = true
        try await AuthService().createUser(withEmail: emailInputText, password: passwordInputText, fullName: fullNameInputText)
       // isLoading = false
    }
    
    
}


