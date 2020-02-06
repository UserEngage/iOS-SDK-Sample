//
//  ResetWindowStackSegue.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit

class ResetWindowStackSegue: UIStoryboardSegue {

    override func perform() {
        guard let window = UIApplication.shared.delegate?.window else {
            return
        }

        // create snapshot
        let snapshot = window?.snapshotView(afterScreenUpdates: false)

        // change root view controller
        window?.rootViewController = destination

        // show snapshot and remove it with animation
        if let snapshot = snapshot {
            window?.addSubview(snapshot)
        }

        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            snapshot?.alpha = 0.0
        }, completion: { (finished) -> Void in
            snapshot?.removeFromSuperview()
        })
    }

}
