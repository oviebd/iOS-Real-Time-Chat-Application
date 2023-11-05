//
//  NewMessageView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = NewMessageViewModel()
    @Binding var selectedUser : User?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                InputTextWithBG(text: $vm.toText, placeHolderText: "To")

                Text("Contacts")
                    .foregroundColor(Constants.ColorAsset.textColor2)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                ForEach(vm.users) {
                    user in

                    VStack{
                        SingleNewMessageItemRow(user: user)
                            .onTapGesture {
                                selectedUser = user
                                dismiss()
                            }
                    }.padding(.horizontal)
                    
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }.foregroundColor(Constants.ColorAsset.primaryTextColor)
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView( selectedUser: .constant(User.Mock_User))
        }
    }
}
