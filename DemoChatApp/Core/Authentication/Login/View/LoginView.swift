//
//  LoginView.swift
//  DemoChatApp
//
//  Created by Habibur Rahman on 26/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVm: LoginViewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                Image(Constants.Images.MessengerLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                inputView
                    .padding(.horizontal, 20)
                    .padding(.top, 25)

                forgotView
                    .padding(.top)

                loginButton
                    .padding(.top, 20)

                orDivider
                    .padding(.horizontal, 20)
                    .padding(.top)

                faceBookLogin
                    .padding(.top)

                Spacer()

                Divider()

                signupView
                    .padding(.top)
                    .padding(.bottom, 30)
            }
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    var inputView: some View {
        VStack(spacing: 10) {
            DefaultInputText(text: $loginVm.emailInputText, placeHolderText: "Enter Email")
                .keyboardType(.emailAddress)
                .modifier(DefaultRectangleBg(cornerRadius: 10))

            DefaultInputText(text: $loginVm.passwordInputText, placeHolderText: "Enter Password")
                .modifier(DefaultRectangleBg(cornerRadius: 10))
        }
    }

    var forgotView: some View {
        Button {
            print("Forgot pressed")
        } label: {
            Text("Forgot Password?")
                .font(.footnote)
                .fontWeight(.semibold)

        }.frame(maxWidth: .infinity, alignment: .trailing)

            .padding(.trailing, 20)
    }

    var loginButton: some View {
        Button {
            Task{try await loginVm.login()}
        } label: {
            Text("Login")
                .padding(12)
                .foregroundColor(.white)
                .font(.body)
                .fontWeight(.semibold)
                .frame(width: Utility.getScreenWidth() - 40)
                .modifier(DefaultRectangleBg(cornerRadius: 10, bgColor: Constants.ColorAsset.primaryBlueColor))
        }
    }

    var orDivider: some View {
        HStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Constants.ColorAsset.viewBackgroundLight)

            Text("OR")
                .padding(.horizontal, 5)
                .foregroundColor(Constants.ColorAsset.textColor2)
                .font(.footnote)

            Rectangle()
                .frame(height: 1)
                .foregroundColor(Constants.ColorAsset.viewBackgroundLight)
        }
    }

    var faceBookLogin: some View {
        Button {
        } label: {
            HStack {
                Image(Constants.Images.facebookIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Connect with facebook")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Constants.ColorAsset.primaryBlueColor)
            }
        }
    }

    var signupView: some View {
        
        NavigationLink{
            RegistrationView()
                .navigationBarBackButtonHidden()
        }label: {
            HStack {
                Text("Don't have an account")
                Text("Signup")
                    .fontWeight(.semibold)

            }.font(.footnote)
                .foregroundColor(Constants.ColorAsset.primaryBlueColor)
        }
    }
}
