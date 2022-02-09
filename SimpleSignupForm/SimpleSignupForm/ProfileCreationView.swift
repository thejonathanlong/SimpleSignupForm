//
//  ProfileCreationView.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

class ProfileCreationViewModel<TextFieldViewmodel>: ObservableObject where TextFieldViewmodel: TextFieldDisplayable {
    var heading: String
    
    var subHeadings: [String]
    
    var textFieldViewModels: [TextFieldViewmodel]
    
    init(heading: String,
         subHeadings: [String],
         textFieldViewModels: [TextFieldViewmodel] = []) {
        self.heading = heading
        self.subHeadings = subHeadings
        self.textFieldViewModels = textFieldViewModels
    }
    
    func submit() {
        
    }
}

struct ProfileCreationView<TextFieldViewmodel>: View where TextFieldViewmodel: TextFieldDisplayable {
    var viewModel: ProfileCreationViewModel<TextFieldViewmodel>
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                heading
                subheadings
            }
            form.padding()
            Spacer()
            submitButton.padding()
        }
    }
    
    var heading: some View {
        Text(viewModel.heading)
            .style(.heading)
    }
    
    var subheadings: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.subHeadings, id: \.self) {
                Text($0)
                    .style(.subHeading)
            }
        }
    }
    
    var form: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(0..<viewModel.textFieldViewModels.count) {
                PlaceHoldingTextField(viewModel: viewModel.textFieldViewModels[$0])
            }
        }
    }
    
    var submitButton: some View {
        Button(action: {
            viewModel.submit()
        }, label: {
            HStack {
                Spacer()
                Text("Submit")
                Spacer()
            }
            .padding()
            .style(.button)
        })
    }
}

struct ProfileCreationView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreationView(
            viewModel: ProfileCreationViewModel<Preview_TextFieldDisplayable>(
                heading: "Profile Creation",
                subHeadings:
                    ["Use the form below to submit your portfolio.", "An email and password are required."],
                textFieldViewModels: [
                    Preview_TextFieldDisplayable(placeHolder: "First Name"),
                    Preview_TextFieldDisplayable(placeHolder: "Email Address"),
                    Preview_TextFieldDisplayable(placeHolder: "Password"),
                    Preview_TextFieldDisplayable(placeHolder: "Password")]
            ))
    }
}
