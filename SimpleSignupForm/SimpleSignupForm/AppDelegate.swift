//
//  AppDelegate.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppLifeCycleManager.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        AppLifeCycleManager.shared.application(application, configurationForConnecting: connectingSceneSession, options: options)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        AppLifeCycleManager.shared.application(application, didDiscardSceneSessions: sceneSessions)
    }
}

