//
//  LoginScreen.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI
import UIKit

struct LoginScreen: View {
    @EnvironmentObject var user: UserModel
    @State private var isGoToSignUp: Bool = false
    @State private var isGoToForgotPassword: Bool = false
    @State private var isShowAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    private let spaceScale = { () -> CGFloat in
        return 1
    }()

    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                Image("launch_image")
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Username", text: self.$email)
                      .padding()
                        .backgroundColor(.gray)
                      .cornerRadius(5.0)
                      .padding(.bottom, 20)
                    SecureField("Password", text: self.$password)
                      .padding()
                        .backgroundColor(.gray)
                      .cornerRadius(5.0)
                      .padding(.bottom, 20)
                }.padding([.leading, .trailing], 27.5)
                FrameButton(title: "Login", action: { self.signIn() })
                .padding(.top, 16.0 * spaceScale)
                VStack(alignment: .center, spacing: 0.0) {
                    Divider().overlay(Text("or")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .frame(width: 32.0, height: 18)
                        .background(Color.white))
                }
                .padding(.top, 38.0 * spaceScale)
                .padding(.top, (32.0 + 9) * spaceScale)
                HStack(alignment: .center, spacing: 0.0) {
                    Text("Don’t have an account?")
                        .font(.system(size: 14))
                        .foregroundColor(Color.blue)
                }
                .padding(.top, 41.0 * spaceScale)
                Spacer()
            }
            .padding(.horizontal, 24.0)
            .navigationBarTitle("", displayMode: .large)
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $isShowAlert, content: {
                Alert(title: Text(""), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
            })
        }
    }
}

private extension LoginScreen {
    func signIn() {
        return
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
