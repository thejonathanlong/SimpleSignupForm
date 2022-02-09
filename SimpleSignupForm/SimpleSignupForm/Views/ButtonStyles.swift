//
//  ButtonStyles.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import SwiftUI

public struct ScaledButtonStyle: ButtonStyle {
    
    var pressedScale: CGFloat
    var tintColor: Color?
    
    public init(tintColor: Color? = nil,
                pressedScale: CGFloat = 0.95) {
        self.pressedScale = pressedScale
        self.tintColor = tintColor
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(tintColor)
            .scaleEffect(configuration.isPressed ? pressedScale : 1)
    }
}
