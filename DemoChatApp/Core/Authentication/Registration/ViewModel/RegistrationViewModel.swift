//
//  RegistrationViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import Foundation

class RegistrationViewModel : ObservableObject {
    @Published var emailInputText : String = ""
    @Published var passwordInputText : String = ""
    @Published var fullNameInputText : String = ""
    
}
