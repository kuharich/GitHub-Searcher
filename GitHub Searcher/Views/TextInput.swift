//
//  TextInput.swift
//  GitHub Searcher
//
//  Created by Mark Kuharich on 4/1/20.
//  Copyright © 2020 Mark Kuharich. All rights reserved.
//

import SwiftUI

enum TextInputType {
    case email
    case password
    case firstName
    case lastName
    case confirmPassword
    case verifyCode

    func title() -> String {
        switch self {
        case .email:
            return "Email"
        case .password:
            return "Password"
        case .firstName:
            return "First name"
        case .lastName:
            return "Last name"
        case .confirmPassword:
            return "Confirm password"
        case .verifyCode:
            return "Verify code"
        }
    }

    func placeHolder() -> String {
        switch self {
        case .email:
            return "Enter your email"
        case .password:
            return "Enter your password"
        case .firstName:
            return "Enter your first name"
        case .lastName:
            return "Enter your last name"
        case .confirmPassword:
            return "Re-enter your password"
        case .verifyCode:
            return "Enter verify code"
        }
    }

    func keyboardType() -> UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress
        case .verifyCode:
            return .numberPad
        default:
            return .default
        }
    }
}

struct CommonInput: View {
    var type: TextInputType
    @Binding var inputText: String

    var body: some View {
        TextField(type.placeHolder(), text: $inputText)
            .padding(.horizontal, 16.0)
            .frame(height: 48.0)
            .font(.system(size: 16))
            .foregroundColor(.blue)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.systemBlue, lineWidth: 1))
            .keyboardType(type.keyboardType())
            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            .padding(/*@START_MENU_TOKEN@*/.top, 2.0/*@END_MENU_TOKEN@*/)
    }
}

struct TextInput: View {
    var type: TextInputType
    @Binding var inputText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(type.title())
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.systemGray)
                .frame(height: 18.0)
            if type == .password || type == .confirmPassword {
                SecureField(type.placeHolder(), text: $inputText)
                    .padding(.horizontal, 16.0)
                    .frame(height: 48.0)
                    .font(.system(size: 16))
                    .foregroundColor(.blue)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.systemBlue, lineWidth: 1))
                    .keyboardType(type.keyboardType())
                    .padding(/*@START_MENU_TOKEN@*/.top, 2.0/*@END_MENU_TOKEN@*/)
            } else {
                CommonInput(type: type, inputText: $inputText)
            }
        }
    }
}

struct TextInput_Previews: PreviewProvider {
    @State static private var inputText: String = ""
    static var previews: some View {
        TextInput(type: .email, inputText: $inputText)
    }
}
