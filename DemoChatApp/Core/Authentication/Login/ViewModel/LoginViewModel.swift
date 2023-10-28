//
//  LoginViewModel.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import Foundation

class LoginViewModel : ObservableObject {
    
    @Published var emailInputText : String = ""
    @Published var passwordInputText : String = ""
    
}
