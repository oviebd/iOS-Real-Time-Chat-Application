//
//  ContentView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group{
            
            if viewModel.userSession != nil {
                InboxView()
            }else {
                LoginView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
