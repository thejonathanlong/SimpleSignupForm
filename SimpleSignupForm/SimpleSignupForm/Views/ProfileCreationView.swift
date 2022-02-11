//
//  ProfileCreationView.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

struct ProfileCreationView<TextFieldViewModel>: View where TextFieldViewModel: TextFieldDisplayable {
    @State var orientation: UIDeviceOrientation = UIDevice.current.orientation
    @EnvironmentObject var viewModel: ProfileCreationViewModel<TextFieldViewModel>
    
    var body: some View {
        VStack(spacing: viewSpacing()) {
            VStack(alignment: .leading, spacing: viewSpacing()) {
                heading
                subheadings
            }
            if orientation == .landscapeLeft || orientation == .landscapeRight {
                horizontalform.padding([.leading, .trailing])
            } else {
                form.padding([.leading, .trailing])
            }
            Spacer()
            submitButton.padding([.leading, .trailing])
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            orientation = UIDevice.current.orientation
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
                    .style(.body)
            }
        }
    }
    
    var form: some View {
        VStack(alignment: .leading, spacing: formSpacing()) {
            ForEach(0..<viewModel.textFieldViewModels.count) {
                PlaceHoldingTextField<TextFieldViewModel>().environmentObject(viewModel.textFieldViewModels[$0])
            }
        }
    }
    
    var horizontalform: some View {
        VStack(alignment: .leading, spacing: formSpacing()) {
            if viewModel.textFieldViewModels.count >= 2 {
                HStack {
                    ForEach(0..<2) {
                        PlaceHoldingTextField<TextFieldViewModel>().environmentObject(viewModel.textFieldViewModels[$0])
                    }
                }
                ForEach(2..<viewModel.textFieldViewModels.count) {
                    PlaceHoldingTextField<TextFieldViewModel>().environmentObject(viewModel.textFieldViewModels[$0])
                }
            } else {
                ForEach(0..<viewModel.textFieldViewModels.count) {
                    PlaceHoldingTextField<TextFieldViewModel>().environmentObject(viewModel.textFieldViewModels[$0])
                }
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
            .buttonStyle(ScaledButtonStyle(tintColor: nil, pressedScale: 0.9))
    }
    
    func viewSpacing() -> CGFloat {
        switch orientation {
            case .portrait:
                return 20
                
            case .portraitUpsideDown:
                return 20
                
            case .landscapeLeft:
                return 10
                
            case .landscapeRight:
                return 10
            
            default:
                return 20
        }
    }
    
    func formSpacing() -> CGFloat {
        switch orientation {
            case .portrait:
                return 16
                
            case .portraitUpsideDown:
                return 16
                
            case .landscapeLeft:
                return 8
                
            case .landscapeRight:
                return 8
            
            default:
                return 16
        }
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
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
