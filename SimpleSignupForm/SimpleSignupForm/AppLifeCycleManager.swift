//
//  AppLifeCycleManager.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import Foundation
import UIKit
import SwiftUI

class AppLifeCycleManager {

    static let shared = AppLifeCycleManager()

    var window: UIWindow?

    lazy var state = AppState()

    var store: AppStore?

    var router: RouteController

    init(router: RouteController = Router.shared) {
        self.router = router
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        store = AppStore(initialState: state,
                                  reducer: appReducer,
                                  middlewares: [
                                  ])

        return true
    }
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        if let store = store {
            window = UIWindow(windowScene: windowScene)
            let profileCreationView = ProfileCreationView<TextFieldViewModel>().environmentObject(store.state.profileCreationState.profileCreationViewModel)
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.white
            let rootViewController = HostedViewController(contentView: profileCreationView, backgroundView: backgroundView)
            
            window?.rootViewController = rootViewController
            router.rootViewController = rootViewController
            window?.makeKeyAndVisible()
        } else {
            // If for some reason we don't have a store, then create one and start over.
            store = AppStore(initialState: state, reducer: appReducer, middlewares: [])
            self.scene(scene, willConnectTo: session, options: connectionOptions)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
