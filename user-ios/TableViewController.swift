//
//  TableViewController.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit
import UserSDK

class TableViewController: TrackableTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // register basic data cell
        tableView.register(UINib(nibName: "DataCell", bundle: .main), forCellReuseIdentifier: "DataCell")
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
