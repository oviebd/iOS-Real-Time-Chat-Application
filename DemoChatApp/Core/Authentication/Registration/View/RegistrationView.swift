//
//  RegistrationView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 27/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.dismiss) var dismiss

    @StateObject var registrationVM = RegistrationViewModel()

    var body: some View {
        VStack {
            Spacer()

            Image(Constants.Images.MessengerLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            VStack(spacing: 10) {
                DefaultInputText(text: $registrationVM.emailInputText, placeHolderText: "Enter Email", keyBoardType: .emailAddress)
                    .modifier(DefaultRectangleBg(cornerRadius: 10))

                DefaultInputText(text: $registrationVM.fullNameInputText, placeHolderText: "Enter Full Name", keyBoardType: .namePhonePad)
                    .modifier(DefaultRectangleBg(cornerRadius: 10))

                DefaultInputText(text: $registrationVM.passwordInputText, placeHolderText: "Enter Password")
                    .modifier(DefaultRectangleBg(cornerRadius: 10))
            }.padding(20)

            signupButton

            Spacer()

            Divider()

            signinView
                .padding(.top, 20)

        }
        .modifier(DefaultAlertModifier(isLoading: $registrationVM.isLoading, isCancelable: true, cancelAction: {
            print("Cancel Action")
        }))
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

extension RegistrationView {
    var signupButton: some View {
        Button {
            Task { try await registrationVM.createUser() }
        } label: {
            Text("Sign Up")
                .padding(12)
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.semibold)
                .frame(width: Utility.getScreenWidth() - 40)
                .modifier(DefaultRectangleBg(cornerRadius: 10, bgColor: Constants.ColorAsset.primaryBlueColor))
        }
    }

    var signinView: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Text("Alreafy Have an account?")
                Text("Signin")
                    .fontWeight(.semibold)

            }.font(.footnote)
                .foregroundColor(Constants.ColorAsset.primaryBlueColor)
        }
    }
}
