//
//  PlaceHoldingTextField.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

enum TextFieldType {
    case name
    case email
    case password
    case website
    
    var placeHolder: String {
        switch self {
            case .name:
                return "First Name"
            case .email:
                return "Email Address"
            case .password:
                return "Password"
            case .website:
                return "Website"
        }
    }
}

protocol TextFieldDisplayable: ObservableObject {
    var placeHolder: String { get }
    var text: String { get set }
    var error: String { get }
    var type: TextFieldType { get }
    func didSubmit()
    var isValid: Bool { get }
}

struct PlaceHoldingTextField<ViewModel>: View where ViewModel: TextFieldDisplayable {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            errorMessage
            textField
            .padding()
            .style(.textFieldContainer)
        }
    }
    
    @ViewBuilder var errorMessage: some View {
        if !viewModel.error.isEmpty {
            Text(viewModel.error)
                .style(.error)
                .padding(.leading, 16)
                
        }
    }
    
    var textField: some View {
        ZStack (alignment: .leading) {
            TextField("", text: $viewModel.text) { editingChanged in
                if !editingChanged {
                    viewModel.didSubmit()
                }
            }
            .style(.textField(.primary))
            placeHolder
                .allowsHitTesting(false)
        }
    }
    
    @ViewBuilder var placeHolder: some View {
        if viewModel.text.isEmpty {
            Text(viewModel.placeHolder)
                .style(.textField(.secondary))
        }
    }
}

class Preview_TextFieldDisplayable: TextFieldDisplayable {
    var type: TextFieldType
    
    var error: String
    
    var placeHolder: String
    
    var text: String
    
    var isValid: Bool = true
    
    init(text: String = "",
         placeHolder: String = "",
         error: String = "") {
        self.text = text
        self.placeHolder = placeHolder
        self.error = error
        self.type = .name
    }
    
    func didSubmit() {
        
    }
    
}

struct PlaceHoldingTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PlaceHoldingTextField<Preview_TextFieldDisplayable>().environmentObject(Preview_TextFieldDisplayable(placeHolder: "Placeholder"))
            PlaceHoldingTextField<Preview_TextFieldDisplayable>().environmentObject(Preview_TextFieldDisplayable(text: "some text"))
            PlaceHoldingTextField<Preview_TextFieldDisplayable>().environmentObject(Preview_TextFieldDisplayable(text: "Is this right?", error: "Wrong stuff"))
        }
    }
}
