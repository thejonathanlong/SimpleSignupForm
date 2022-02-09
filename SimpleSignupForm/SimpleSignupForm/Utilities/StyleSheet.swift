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
        case button
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
                
                case .button:
                    return .white
            }
        }
        
        var cornerRadius: CGFloat {
            switch self {
                case .textFieldContainer:
                    return 16.0
                
                case .button:
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
                case .button:
                    return .red
                    
                default:
                    return .clear
            }
        }
        
        var background: some View {
            Group {
                switch self {
                    case .button:
                        LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        
                    default:
                        RoundedRectangle(cornerRadius: cornerRadius)
                                        .stroke(borderColor ?? .clear)
                                        .background(backgroundColor ?? .clear)
                }
            }
        }
        
        var font: Font? {
            switch self {
                case .heading:
                    return Font.custom("Verdana", size: 40.0, relativeTo: .largeTitle)
                    
                case .subHeading:
                    return Font.custom("Verdana", size: 16.0, relativeTo: .headline)
                    
                case .textField:
                    return Font.custom("Verdana", size: 16.0, relativeTo: .body)
                    
                case .error:
                    return Font.custom("Verdana", size: 16.0, relativeTo: .body)
                
                case .button:
                    return Font.custom("Verdana", size: 16.0, relativeTo: .body)
                
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
            .background(styleType.background)
    }
}

extension View {
    func style(_ type: StyleSheet.StyleType) -> some View {
        modifier(Style(styleType: type))
    }
}

extension Text {
    func style(_ type: StyleSheet.StyleType) -> some View {
        modifier(Style(styleType: type))
            .font(type.font)
    }
}

extension TextField {
    func style(_ type: StyleSheet.StyleType) -> some View {
        modifier(Style(styleType: type))
            .font(type.font)
    }
}
