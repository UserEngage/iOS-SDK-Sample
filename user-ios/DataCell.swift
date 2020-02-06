//
//  DataCell.swift
//  user-ios
//
//  Created by Andrzej Puczyk on 09/03/2019.
//  Copyright © 2019 Andrzej Puczyk. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet private var keyLabel: UILabel?
    @IBOutlet private var valueLabel: UILabel?

    func fill(with data: (key: String, value: Any)) {
        keyLabel?.text = data.key
        valueLabel?.text = data.value as? String ?? "\(data.value)"
    }

}
