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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        store = AppStore(initialState: state,
                                  reducer: appReducer,
                                  middlewares: [
                                    profileServiceMiddleware(service: ProfileService())
                                  ])
        state.profileComfirmationState.viewModelFactory.store = store
        state.profileCreationState.viewModelFactory.store = store

        return true
    }
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let profileCreationViewModel = state.profileCreationState.viewModelFactory.createProfileViewModel(heading: "Profile Creation", subHeading: ["Use the form below to submit your portfolio.", "An email and password are required."])
        
        let profileCreationView = ProfileCreationView<TextFieldViewModel>().environmentObject(profileCreationViewModel)
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.white
        let rootViewController = HostedViewController(contentView: profileCreationView, backgroundView: backgroundView)
        
        window?.rootViewController = rootViewController
        state.router.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
