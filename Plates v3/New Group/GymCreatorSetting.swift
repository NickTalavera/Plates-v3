//
//  InventoryAdvancedSettingsPopoverSegue.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import UIKit

class GymCreatorSetting: UIViewController {
    let textCellIdentifier: String = "TextCell"
    weak var delegate: MainDelegate?
    var sortedAlready = false

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func saveButtonAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBAction func cancelButtonAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutSubviews()
    }

}
