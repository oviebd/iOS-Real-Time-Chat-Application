//
//  CustomAlert.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 31/10/23.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var presentAlert: Bool

 
    var title: String = Constants.AppConstants.AppName
    var message: String = ""
    var leftActionText: String = "Ok"
    var rightButtonText: String = "Cancel"

    var isMultipleActionButtonActive: Bool = false
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?

    var body: some View {
        ZStack {
            if isMultipleActionButtonActive {
                Text("")
                    .alert(isPresented: self.$presentAlert) {
                        Alert(title: Text(title), message: Text(message), primaryButton: Alert.Button.default(Text(rightButtonText), action: {
                            if let btnACtion = rightButtonAction {
                                btnACtion()
                            }
                            presentAlert = false
                            // print("Right clicked")
                        }), secondaryButton: Alert.Button.cancel(Text(leftActionText), action: {
                            if let btnACtion = leftButtonAction {
                                btnACtion()
                            }
                            presentAlert = false
                        })
                        )
                    }
            } else {
                Text("")
                    .alert(title, isPresented: $presentAlert) {
                        Button(leftActionText) {
                            if let btnACtion = leftButtonAction {
                                btnACtion()
                                presentAlert = false
                            }
                        }
                    } message: {
                        Text(message)
                    }
            }
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(presentAlert: .constant(true))
    }
}
