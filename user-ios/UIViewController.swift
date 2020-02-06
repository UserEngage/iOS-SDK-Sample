//
//  UIViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(
        title: String?,
        message: String?,
        okActionCompletion: (() -> Void)? = nil,
        cancelActionCompletion: @escaping (() -> Void) = {}) {

        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelTitle = okActionCompletion != nil ? "Cancel" : "OK"

        // add cancel action if needed
        controller.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: { [cancelActionCompletion] _ in
            cancelActionCompletion()
        }))

        // add ok action if needed
        if let okActionCompletion = okActionCompletion {
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: { [okActionCompletion] _ in
                okActionCompletion()
            }))
        }

        present(controller, animated: true, completion: nil)
    }

    func displayLogoOnNavBar() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "navBar-logo"))
    }

}
