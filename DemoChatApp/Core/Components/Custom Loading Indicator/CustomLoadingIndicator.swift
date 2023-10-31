//
//  CustomLoadingIndicator.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 31/10/23.
//

import SwiftUI

struct CustomLoadingIndicator: View {
    var body: some View {
//        VStack {
//            ProgressView {
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//            .scaleEffect(2)
//            .zIndex(1)
//        }
        VStack{
            HStack{
                Spacer()
            }
            Spacer()
        }.overlay{
            ProgressView { }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .scaleEffect(2)
            .zIndex(1)
             .background(Color.black)
        }
       
    }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoadingIndicator()
    }
}
