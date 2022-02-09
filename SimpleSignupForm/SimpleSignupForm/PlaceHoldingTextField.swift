//
//  PlaceHoldingTextField.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

protocol TextFieldDisplayable: ObservableObject {
    var placeHolder: String { get }
    var text: String { get set }
    var error: String { get }
}

struct PlaceHoldingTextField<ViewModel>: View where ViewModel: TextFieldDisplayable {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if !viewModel.error.isEmpty {
                Text(viewModel.error)
                    .style(.error)
                    .padding(.leading, 16)
            }
            ZStack (alignment: .leading) {
                TextField("", text: $viewModel.text)
                    .style(.textField(.primary))
                if viewModel.text.isEmpty {
                    Text(viewModel.placeHolder)
                        .style(.textField(.secondary))
                }
            }
            .padding()
            .style(.textFieldContainer)
        }
        
    }
}

class Preview_TextFieldDisplayable: TextFieldDisplayable {
    var error: String
    
    var placeHolder: String
    
    var text: String
    
    init(text: String = "",
         placeHolder: String = "",
         error: String = "") {
        self.text = text
        self.placeHolder = placeHolder
        self.error = error
    }
    
}

struct PlaceHoldingTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable(placeHolder: "Placeholder"))
            PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable(text: "some text"))
            PlaceHoldingTextField(viewModel: Preview_TextFieldDisplayable(text: "Is this right?", error: "Wrong stuff"))
        }
    }
}
