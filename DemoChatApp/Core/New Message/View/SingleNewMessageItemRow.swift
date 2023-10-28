//
//  SingleNewMessageItemRow.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 28/10/23.
//

import SwiftUI

struct SingleNewMessageItemRow: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Constants.ColorAsset.viewBackgroundLight)

                Text("Name")
                    .foregroundColor(Constants.ColorAsset.primaryTextColor)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
            }

            Divider()
                .padding(.leading, 40)
        }
    }
}

struct SingleNewMessageItemRow_Previews: PreviewProvider {
    static var previews: some View {
        SingleNewMessageItemRow()
    }
}
