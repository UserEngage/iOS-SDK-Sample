//
//  SDKDataViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class SDKDataViewController: TableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as? DataCell, let data = self.data(for: indexPath) else {
            return UITableViewCell()
        }

        cell.fill(with: data)
        return cell
    }

}

// MARK: Getting data form SDK instance

extension SDKDataViewController {

    private func data(for indexPath: IndexPath) -> (key: String, value: Any)? {
        guard let userSDK = UserSDK.default else { return nil }
        switch indexPath.row {
        case 0: return ("API key", userSDK.apiKey)
        case 1: return ("Base URL", userSDK.baseURL)
        case 2: return ("Activities auto tracking", userSDK.shouldTrackActivities)
        default: return nil
        }
    }

}
