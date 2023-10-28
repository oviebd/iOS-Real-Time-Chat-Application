//
//  InboxView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessageView = false
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                ActiveNowView()
                    .padding(.leading,20)
                 
                  
                List{
                    ForEach(0 ... 10, id: \.self){
                        message in
                        InboxRowView()
                    }
                }.listStyle(PlainListStyle())
                    .frame(height: UIScreen.main.bounds.height - 120)
                   
                
            }.fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
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
            Image(systemName: "person.circle.fill")
            Text("Chats")
                .font(.title)
                .fontWeight(.semibold)
        }
    }

    var trailingToolbarItem: some View {
        Button {
            showNewMessageView.toggle()
            print("show new message view")
        } label: {
            Image(systemName: "square.and.pencil.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.black, Constants.ColorAsset.viewBackgroundLight)
        }
    }
}
