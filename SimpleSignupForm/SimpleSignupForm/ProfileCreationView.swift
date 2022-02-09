//
//  ProfileCreationView.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

struct ProfileCreationView<TextFieldViewModel>: View where TextFieldViewModel: TextFieldDisplayable {
    @EnvironmentObject var viewModel: ProfileCreationViewModel<TextFieldViewModel>
    
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
                PlaceHoldingTextField<TextFieldViewModel>().environmentObject(viewModel.textFieldViewModels[$0])
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
        ProfileCreationView<Preview_TextFieldDisplayable>().environmentObject(ProfileCreationViewModel<Preview_TextFieldDisplayable>(
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
