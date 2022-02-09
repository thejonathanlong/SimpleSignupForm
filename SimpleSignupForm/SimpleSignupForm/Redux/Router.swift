//
//  Router.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import UIKit

enum Route {
    case confirmation(ConfirmationViewModel)
}

protocol RouteController {
    var rootViewController: UIViewController? { get set }
    func route(to destination: Route)
}

class Router: RouteController {

    static let shared = Router()
    
    var rootViewController: UIViewController?
    
    func route(to destination: Route) {
        switch destination {
            case .confirmation(let confirmationViewModel):
                showConfirmationView(viewModel: confirmationViewModel)
        }
        
    }
}

private extension Router {
    func showConfirmationView(viewModel: ConfirmationViewModel) {
        let hostingController = HostedViewController(contentView: ConfirmationView(viewModel: viewModel))
        hostingController.modalPresentationStyle = .fullScreen
        
        rootViewController?.present(hostingController, animated: true, completion: nil)
    }
}
