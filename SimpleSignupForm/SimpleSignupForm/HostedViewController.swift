//
//  HostedViewController.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation

import UIKit
import SwiftUI

public class HostedViewController<ContentView>: UIViewController where ContentView: View {
    
    public enum ContentViewAlignment {
        case top, bottom, leading, trailing
        case fill(UIEdgeInsets)
    }
    
    public let backgroundView: UIView?
    
    private let hostingController: UIHostingController<ContentView>
    
    private let alignment: ContentViewAlignment
    
    private var currentContentConstraints: [NSLayoutConstraint] = []
    
    public init(contentView: ContentView,
                backgroundView: UIView? = nil,
                alignment: ContentViewAlignment = .fill(UIEdgeInsets.zero)) {
        self.hostingController = UIHostingController(rootView: contentView)
        self.backgroundView = backgroundView
        self.alignment = alignment
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        view.clipsToBounds = true
        hostingController.view.backgroundColor = UIColor.clear
        hostingController.willMove(toParent: self)
        hostingController.view.willMove(toSuperview: view)
        
        if let backgroundView = backgroundView {
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(backgroundView)
            NSLayoutConstraint.activate([backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                         backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                         backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
                                         backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),])
        }
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.didMove(toParent: self)
        hostingController.view.didMoveToSuperview()
        currentContentConstraints = constraints(for: alignment, size: view.frame.size)
        NSLayoutConstraint.activate(currentContentConstraints)
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        NSLayoutConstraint.deactivate(currentContentConstraints)
        currentContentConstraints = constraints(for: alignment, size: size)
        NSLayoutConstraint.activate(currentContentConstraints)
    }
}

//MARK: - Private
private extension HostedViewController {
    func constraints(for alignment: ContentViewAlignment, size: CGSize) -> [NSLayoutConstraint] {
        guard let hostedView = hostingController.view else { return [] }
        hostedView.translatesAutoresizingMaskIntoConstraints = false

        switch alignment {
            case .top:
                return [
                    hostedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    hostedView.topAnchor.constraint(equalTo: view.topAnchor),
                ]
            case .bottom:
                return [
                    hostedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    hostedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                ]
            case .leading:
                return [
                    hostedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    hostedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    hostedView.topAnchor.constraint(equalTo: view.topAnchor),
                ]
            case .trailing:
                return [
                    hostedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    hostedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    hostedView.topAnchor.constraint(equalTo: view.topAnchor),
                ]
            case .fill(let insets):
                return [
                    hostedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left),
                    hostedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right),
                    hostedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom),
                    hostedView.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
                ]
        }
    }
}
