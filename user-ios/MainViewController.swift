//
//  MainViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 08/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class MainViewController: TableViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if user wants to log out,
        // if so, wipe all the data by logout action from SDK
        if segue.identifier == "logout" {
            UserSDK.default?.logout()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayLogoOnNavBar()
        registerForNotifications()
    }

}

// MARK: Notifications delegate

extension MainViewController: RemoteNotificationDelegate {

    private func registerForNotifications() {
        // register for notifications
        UserSDK.default?.registerForRemoteNotifications(options: [.alert, .badge, .sound])
        UserSDK.default?.notificationDelegate = self
    }

    func didReceiveRemoteNotification(with id: String, data: [AnyHashable : Any]) {
        let title = data["title"] as? String
        var message = data["message"] as? String

        message?.append(" (powiadomienie obsługiwane przez aplikację)")
        showAlert(title: title, message: message)
    }

}
