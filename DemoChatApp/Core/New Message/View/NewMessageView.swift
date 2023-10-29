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

    var body: some View {
        NavigationStack {
            ScrollView {
                InputTextWithBG(text: $vm.toText, placeHolderText: "To")

                Text("Contacts")
                    .foregroundColor(Constants.ColorAsset.textColor2)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                ForEach(0 ... 10, id: \.self) {
                    _ in

                    VStack{
                        SingleNewMessageItemRow(user: User.Mock_User)
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
            NewMessageView()
        }
    }
}
