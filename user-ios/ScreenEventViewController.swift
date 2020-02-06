//
//  ScreenEventViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 31/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class ScreenEventViewController: TableViewController {

    @IBOutlet private var screenNameField: UITextField?

    @IBAction
    private func send() {
        guard let name = screenNameField?.text, name.count > 0 else {
            showAlert(title: "Error", message: "You must fill name field to send screen event correctly. Would you like to prefill the field?", okActionCompletion: { [weak self] in
                // prefill fields
                self?.screenNameField?.text = "Default_screen_name"
            })
            return
        }

        UserSDK.default?.trackScreen(with: name)
    }

}
