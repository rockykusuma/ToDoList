//
//  LoginView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "To Do List", subTitle: "Note it down", angle: -40, backgroundColor: .mint)
                formView
                registrationView
            }
        }
    }
}

extension LoginView {
    
    var formView: some View {
        Form {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            TextField("Email Address", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
            TDLButton(title: "Log In", backgroundColor: .mint) {
                viewModel.login()
            }
            .padding(.top, 16)
        }
    }
    
    var registrationView: some View {
        VStack {
            Text("New around here")
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Create an Account")
                    .foregroundStyle(.mint)
            }
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    LoginView()
}
