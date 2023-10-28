//
//  InputTextWithBG.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import SwiftUI

struct InputTextWithBG: View {
   
    @Binding var text: String
    var placeHolderText : String
    var placeHolderColor = Constants.ColorAsset.primaryTextColor
    var textColor = Constants.ColorAsset.primaryTextColor
    var keyBoardType : UIKeyboardType =  .default
    var cornerRadius : Double = 10
    
    var body: some View {
        
        DefaultInputText(text: $text, placeHolderText: placeHolderText, keyBoardType: keyBoardType)
            .modifier(DefaultRectangleBg(cornerRadius: cornerRadius))
    }
}

struct InputTextWithBG_Previews: PreviewProvider {
    static var previews: some View {
        InputTextWithBG(text: .constant(""), placeHolderText: "placeholder")
    }
}
