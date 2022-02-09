//
//  ConfirmationView.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

struct ConfirmationView: View {
    var viewModel: ConfirmationViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text(viewModel.heading)
                    .style(.heading)
                Text(viewModel.message)
                    .style(.body)
            }
            .padding()
            VStack(alignment: .center, spacing: 20) {
                Text(viewModel.website)
                    .underline()
                    .style(.link)
                Text(viewModel.name)
                    .style(.body)
                Text(viewModel.email)
                    .style(.body)
            }
            Spacer()
            Button {
                viewModel.signIn()
            } label: {
                HStack {
                    Spacer()
                    Text("Sign In")
                    Spacer()
                }
                .padding()
                .style(.button)
            }
            .padding()

        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView(viewModel: ConfirmationViewModel(website: "amccoy8331.com", name: "Audrey", email: "amccoy9831@hotmail.com"))
    }
}
