//
//  SceneDelegate.swift
//  SimpleSignupForm
//
//  Created by Jonathan Long on 2/8/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        AppLifeCycleManager.shared.scene(scene, willConnectTo: session, options: connectionOptions)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        AppLifeCycleManager.shared.sceneDidDisconnect(scene)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        AppLifeCycleManager.shared.sceneDidBecomeActive(scene)
    }

    func sceneWillResignActive(_ scene: UIScene) {
        AppLifeCycleManager.shared.sceneWillResignActive(scene)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        AppLifeCycleManager.shared.sceneWillEnterForeground(scene)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        AppLifeCycleManager.shared.sceneDidEnterBackground(scene)
    }


}

