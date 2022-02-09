//
//  Router.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import UIKit

enum Route {
    case confirmation(ConfirmationViewModel)
    case alert(Error)
    case dismiss
}

protocol RouteController {
    var rootViewController: UIViewController? { get set }
    func route(to destination: Route)
}

class Router: RouteController {

    static let shared = Router()
    
    var rootViewController: UIViewController?
    
    weak var store: AppStore?
    
    func route(to destination: Route) {
        switch destination {
            case .confirmation(let confirmationViewModel):
                showConfirmationView(viewModel: confirmationViewModel)
            
            case .alert(let error):
                showAlert(for: error)
            
            case .dismiss:
                rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

private extension Router {
    func showConfirmationView(viewModel: ConfirmationViewModel) {
        let background = UIView()
        background.backgroundColor = UIColor.white
        let hostingController = HostedViewController(contentView: ConfirmationView(viewModel: viewModel), backgroundView: background)
        hostingController.modalPresentationStyle = .fullScreen
        
        rootViewController?.present(hostingController, animated: true, completion: nil)
    }
    
    func showAlert(for error: Error) {
        let alert = UIAlertController(title: "Oops...", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        rootViewController?.present(alert, animated: true, completion: nil)
    }
}
