//
//  UniversalFunctions.swift
//  Bar - Barbell Plate Weight Calculator
//
//  Created by Nick Talavera on 4/29/16.
//  Copyright © 2016 Nick Talavera. All rights reserved.
//

import Foundation
import UIKit

protocol MainDelegate: class {
    func resetEverythingProtocol()
func presentRemoveAdsSettingsPopover()
    func presentInventoryAdvancedSettingsPopover()
    func presentBarbellAdvancedSettingsPopover()
    func presentCollarAdvancedSettingsPopover()
    func drawPlatesProtocol()
    func updatePageProtocol()
    func setToWeightTextField()
    func switchUnitsToWrapDelegate(_ unit: String)
    func updateButtonsEnabledProtocol()
    func dismissPopovers()
    func restorePurchases()
    func buyIAP()
    func presentCustomizedPrompt()
}

