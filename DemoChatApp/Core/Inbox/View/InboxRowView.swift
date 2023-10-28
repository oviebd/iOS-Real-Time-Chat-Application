//
//  InboxRowView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
       
        HStack (alignment: .top) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundColor(Constants.ColorAsset.viewBackgroundLight)
            
            VStack(alignment: .leading){
                Text("Name")
                    .foregroundColor(Constants.ColorAsset.primaryTextColor)
                    .fontWeight(.bold)
                Text("Message")
                    .foregroundColor(Constants.ColorAsset.textColor2).lineLimit(2)

            }.padding(.top,10)
                .font(.subheadline)
            
            Spacer()
            
            HStack{
                Text("Message")
                    .foregroundColor(Constants.ColorAsset.textColor2)
                    .padding(.top,10)
                
                Image(systemName: "chevron.right")
                
            }
            
//            Image(systemName: "person.circle.fill")
//                .resizable()
//                .frame(width: 64, height: 64)
//                .foregroundColor(Constants.ColorAsset.viewBackgroundLight)
          
            
        }
        
        
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
