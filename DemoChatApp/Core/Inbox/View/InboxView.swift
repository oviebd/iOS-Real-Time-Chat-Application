//
//  InboxView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import SwiftUI

struct InboxView: View {
    @State private var showNewMessageView = false
    @StateObject private var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false

    private var user: User? {
        return viewModel.currentUser
    }

    var body: some View {
        NavigationStack {
            List {
                ActiveNowView(user: User.Mock_User)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)

                ForEach(viewModel.recentMessages) {
                    message in

                    ZStack {
                        NavigationLink(value: message) {
                            EmptyView()
                        }.opacity(0.0)
                        InboxRowView(message: message)
                    }
                }
            }.listStyle(PlainListStyle())

                .onChange(of: selectedUser, perform: { newValue in
                    showChat = newValue != nil
                })
                .navigationDestination(for: Message.self, destination: { message in
                    if let user = message.user {
                        ChatView(user: user)
                    }
                })
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(user: user)
                })
                .navigationDestination(isPresented: $showChat, destination: {
                    if let user = selectedUser {
                        ChatView(user: user)
                    }
                })
                .fullScreenCover(isPresented: $showNewMessageView, content: {
                    NewMessageView(selectedUser: $selectedUser)
                })

                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        leadingToolbarItem
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        trailingToolbarItem
                    }
                }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}

extension InboxView {
    var leadingToolbarItem: some View {
        HStack {
            NavigationLink(value: user) {
                CircularProfileImageView(user: user, size: .xSmall)
            }
            Text("Chats")
                .font(.title)
                .fontWeight(.semibold)
        }
    }

    var trailingToolbarItem: some View {
        Button {
            showNewMessageView.toggle()
            selectedUser = nil
        } label: {
            Image(systemName: "square.and.pencil.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.black, Constants.ColorAsset.viewBackgroundLight)
        }
    }
}
