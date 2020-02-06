//
//  UserDataViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 08/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class UserDataViewController: TableViewController {
    private var userDataDictionary: [String: Any] {
        return UserSDK.default?.userDataDictionary ?? [String: Any]()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //UserSDK.default?.setCustomUserData(["attr1" : "custom attribute value"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserSDK.default?.userId == nil {
            //resetUserData()
        }
    }

    @IBAction
    private func resetUserData() {
        UserSDK.default?.ping { [weak self] (_, _) in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Customer"
        case 1: return "Device"
        default: return nil
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return customerDictionary?.count ?? 0
        case 1: return deviceDictionary?.count ?? 0
        default: return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as? DataCell else {
            return UITableViewCell()
        }

        cell.fill(with: self.data(for: indexPath))
        return cell
    }
}

// MARK: Getting data form user data dict

extension UserDataViewController {

    private func data(for indexPath: IndexPath) -> (key: String, value: Any) {
        let dict = (indexPath.section == 0 ? customerDictionary : deviceDictionary) ?? [:]
        return dict.sorted(by: { (left, right) -> Bool in
            return left.key < right.key
        })[indexPath.row]
    }

    private var customerDictionary: [String: Any]? { return userDataDictionary["customer"] as? [String: Any] }
    private var deviceDictionary: [String: Any]? { return userDataDictionary["device"] as? [String: Any] }

}
