//
//  Router.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import UIKit

enum Route {
    
}

protocol RouteController {
    var rootViewController: UIViewController? { get set }
    func route(to destination: Route)
}

class Router: RouteController {

    static let shared = Router()
    
    var rootViewController: UIViewController?
    
    func route(to destination: Route) {
        
    }
}
