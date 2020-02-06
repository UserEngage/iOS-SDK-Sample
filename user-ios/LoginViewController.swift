//
//  LoginViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class LoginViewController: TableViewController {
    @IBOutlet private var apiKeyField: UITextField?
    @IBOutlet private var baseURLField: UITextField?
    @IBOutlet private var trackActivitiesSwitch: UISwitch?

    override func viewDidLoad() {
        super.viewDidLoad()
        displayLogoOnNavBar()
        moveOnIfCould()
        fillWithDefaultValues()
    }

    @IBAction
    private func login() {
        let _ = UserSDK(
            application: UIApplication.shared,
            apiKey: apiKeyField?.text ?? Defaults.apiKey,
            baseURL: baseURLField?.text ?? Defaults.baseURL,
            shouldTrackActivities: trackActivitiesSwitch?.isOn ?? Defaults.shouldTrackActivities)

        // move on
        performSegue(withIdentifier: "login", sender: nil)
    }
}

// MARK: Prefill & Login actions

extension LoginViewController {
    private func moveOnIfCould() {
        guard UserSDK.default != nil else { return }
        performSegue(withIdentifier: "login", sender: nil)
    }

    private func fillWithDefaultValues() {
        apiKeyField?.text = Defaults.apiKey
        baseURLField?.text = Defaults.baseURL
        trackActivitiesSwitch?.isOn = Defaults.shouldTrackActivities
    }
}
