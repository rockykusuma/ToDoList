//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var viewModel: RegistrationViewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Start Organizing Notes", angle: -40, backgroundColor: .brown)
            formView
            Spacer()
        }
        .offset(y: -44)
    }
}

extension RegistrationView {
    var formView: some View {
        Form {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            TextField("Full Name", text: $viewModel.name)
                .autocorrectionDisabled()
            TextField("Email Address", text: $viewModel.email)
                .textInputAutocapitalization(.none)
                .autocorrectionDisabled()
            SecureField("Password", text: $viewModel.password)
            TDLButton(title: "Sign Up", backgroundColor: .brown) {
                viewModel.registration()
            }
            .padding(.top, 16)
        }
    }
    
}

#Preview {
    RegistrationView()
}
