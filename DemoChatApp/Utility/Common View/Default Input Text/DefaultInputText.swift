//
//  DefaultInputText.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import SwiftUI

struct DefaultInputText: View {
    
    @Binding var text: String
    var placeHolderText : String

    var placeHolderColor = Constants.ColorAsset.primaryTextColor
    var textColor = Constants.ColorAsset.primaryTextColor
    var keyBoardType : UIKeyboardType =  .default
 
    var body: some View {
        TextField(placeHolderText, text: $text, axis: .vertical)
            .font(.body)
            .foregroundColor(textColor)
            .padding(10)
            .keyboardType(keyBoardType)
        
        
    }
}

struct DefaultInputText_Previews: PreviewProvider {
    static var previews: some View {
        DefaultInputText(text: .constant(""), placeHolderText: "Write here")
    }
}
