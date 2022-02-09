//
//  ProfileCreationView.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

struct ProfileCreationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading) {
                Text("Heading")
                    .font(.largeTitle)
                Text("Sub heading blah blah blah")
                    .font(.subheadline)
            }
            VStack(alignment: .leading, spacing: 25) {
                PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable())
                PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable())
                PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable())
                PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable())
            }
            Spacer()
            Button("Hello") {
                
            }
        }
    }
}

struct ProfileCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreationView()
    }
}
