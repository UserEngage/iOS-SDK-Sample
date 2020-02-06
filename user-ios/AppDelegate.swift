//
//  AppDelegate.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 08/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserSDK.inAppAlertCloseButtonText = "Cancel"
        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        UserSDK.default?.handleNotification(userInfo: userInfo)
        completionHandler(.newData)
    }
}

