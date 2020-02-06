//
//  EventViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class EventViewController: TableViewController {

    @IBOutlet private var eventNameField: UITextField?
    @IBOutlet private var stringParamNameField: UITextField?
    @IBOutlet private var stringValueField: UITextField?
    @IBOutlet private var floatParamNameField: UITextField?
    @IBOutlet private var floatValueField: UITextField?
    @IBOutlet private var boolParamNameField: UITextField?
    @IBOutlet private var boolValueSwitch: UISwitch?

    @IBAction
    private func send() {
        guard let name = eventNameField?.text, name.count > 0 else {
            showAlert(title: "Error", message: "You must fill name field to send event correctly. Would you like to prefill all the fields?", okActionCompletion: { [weak self] in
                // prefill fields
                self?.eventNameField?.text = "Custom_event"
                self?.stringParamNameField?.text = "string_param"
                self?.stringValueField?.text = "Test string value"
                self?.floatParamNameField?.text = "float_param"
                self?.floatValueField?.text = "121.5"
                self?.boolParamNameField?.text = "bool_param"
            })
            return
        }

        // Send event
        UserSDK.default?.sendEvent(with: name, params: eventDictionary) { [weak self] (success, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self?.showAlert(title: "Error", message: error.localizedDescription)
                } else if success == false {
                    self?.showAlert(title: "Failure", message: "Something went wrong, the event wasn't sent correctly.")
                } else {
                    self?.showAlert(title: "Success", message: "The event has been sent correctly.")
                }
            }
        }
    }

}

// MARK: Generate Event dictionary

extension EventViewController {

    private var eventDictionary: [String: Any] {
        var eventDictionary = [String: Any]()
        if let param = stringParamNameField?.text, let value = stringValueField?.text {
            eventDictionary[param] = value
        }

        if let param = floatParamNameField?.text, let value = floatValueField?.text?.floatValue {
            eventDictionary[param] = value
        }

        if let param = boolParamNameField?.text, let value = boolValueSwitch?.isOn {
            eventDictionary[param] = value
        }

        // remove empty fields if needed
        return eventDictionary
            .filter { !$0.key.isEmpty }
    }

}
