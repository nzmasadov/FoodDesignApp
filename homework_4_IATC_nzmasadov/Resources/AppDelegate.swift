//
//  AppDelegate.swift
//  homework_4_IATC_nzmasadov
//
//  Created by Nazim Asadov on 24.04.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MainVC()
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()

        return true
    }
}

