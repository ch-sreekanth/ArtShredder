//
//  SaveFinishedAlertView.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class SaveFinishedAlertView: ArtShredderPageObject {
    
    override var isDesiredPage: Bool {
        return app.element(matchingIdentifier: AXSaveImagePopover.PageHeader).waitForExistence(timeout: 5)
    }
    
    //
    // MARK: Elements
    //
    
    var alertViewIpad: XCUIElement { return app.popovers.otherElements.sheets.matching(identifier: AXSaveFinishedAlert.AlertTitle).element}
    var alertViewIphone: XCUIElement { return app.otherElements.sheets.matching(identifier: AXSaveFinishedAlert.AlertTitle).element}
    
    //
    // MARK: Assertions
    //
    
    @discardableResult
    func assertSaveFinishedAlertExists() -> SaveFinishedAlertView {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            XCTAssertTrue(alertViewIpad.exists, "Save Image Finished Alert View is not displayed on iPad")
        } else {
            XCTAssertTrue(alertViewIphone.exists, "Save Image Finished Alert View is not displayed on iPhone")
        }
        return self
    }
    
    @discardableResult
    func assertMessageOnSaveFinishedAlert() -> SaveFinishedAlertView {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            XCTAssertTrue(alertViewIpad.staticTexts[AXSaveFinishedAlert.AlertMessage].exists, "Alert Message does not exist on iPad")
        } else {
            XCTAssertTrue(alertViewIphone.staticTexts[AXSaveFinishedAlert.AlertMessage].exists, "Alert Message does not exist on iPhone")
        }
        return self
    }
    
}
