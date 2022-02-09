//
//  StyleSheet.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation
import SwiftUI

struct StyleSheet {
    
    enum SubStyle {
        case primary
        case secondary
    }
    
    enum StyleType {
        case heading
        case subHeading
        case textField(SubStyle)
        case textFieldContainer
        case error
        
        var foregroundColor: Color? {
            switch self {
                case .heading:
                    return .black
                    
                case .subHeading:
                    return .black
                    
                case .textField(let sub):
                    switch sub {
                        case .primary:
                            return .black
                        
                        case .secondary:
                            return .gray
                    }
                    
                case .error:
                    return .red
                
                case .textFieldContainer:
                    return nil
            }
        }
        
        var cornerRadius: CGFloat {
            switch self {
                case .textFieldContainer:
                    return 16.0
                
                default:
                    return 0.0
            }
        }
        
        var borderColor: Color? {
            switch self {
                case .textFieldContainer:
                    return .gray
                
                default:
                    return nil
            }
        }
        
        var backgroundColor: Color? {
            switch self {
                default:
                    return nil
            }
        }
        
        var font: Font? {
            switch self {
                case .heading:
                    return Font.custom("AlNile", fixedSize: 72.0)
                    
                case .subHeading:
                    return Font.custom("AlNile", fixedSize: 36.0)
                    
                case .textField:
                    return Font.custom("AlNile", fixedSize: 22.0)
                    
                case .error:
                    return Font.custom("AlNile", fixedSize: 16.0)
                
                case .textFieldContainer:
                    return nil
            }
        }
    }
}

struct Style: ViewModifier {
    let styleType: StyleSheet.StyleType
        
    func body(content: Content) -> some View {
        content
            .foregroundColor(styleType.foregroundColor)
            .background(RoundedRectangle(cornerRadius: styleType.cornerRadius)
                            .stroke(styleType.borderColor ?? .clear)
                            .background(styleType.backgroundColor))
    }
}

extension View {
    func style(_ type: StyleSheet.StyleType) -> some View {
        modifier(Style(styleType: type))
    }
}
