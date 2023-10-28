//
//  InboxRowView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundColor(Constants.ColorAsset.viewBackgroundLight)

            VStack(alignment: .leading, spacing: 5) {
               
                HStack {
                    Text("Name")
                        .foregroundColor(Constants.ColorAsset.primaryTextColor)
                        .fontWeight(.bold)

                    Spacer()

                    Text("Yesterday")
                        .foregroundColor(Constants.ColorAsset.textColor2)
                        .font(.footnote)

                    Image(systemName: "chevron.right")
                        .foregroundColor(Constants.ColorAsset.textColor2)
                        .font(.footnote)
                }

                Text("is1500")
                    .foregroundColor(Constants.ColorAsset.textColor2)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
