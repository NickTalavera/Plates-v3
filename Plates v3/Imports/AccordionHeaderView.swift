//
//  AccordionHeaderView.swift
//  FZAccordionTableViewExample
//
//  Created by Krisjanis Gaidis on 10/5/15.
//  Copyright © 2015 Fuzz. All rights reserved.
//

import UIKit
import FZAccordionTableView

class AccordionHeaderView: FZAccordionTableViewHeaderView {
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerBackground: UIView!
    static let kDefaultAccordionHeaderViewHeight: CGFloat = 44.0;
    static let kAccordionHeaderViewReuseIdentifier: String = "AccordionHeaderViewReuseIdentifier";
}
