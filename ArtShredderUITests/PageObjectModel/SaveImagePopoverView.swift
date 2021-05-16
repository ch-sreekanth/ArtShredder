//
//  SaveImagePopoverView.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class SaveImagePopoverView: ArtShredderPageObject {
    
    override var isDesiredPage: Bool {
        return app.element(matchingIdentifier: AXSaveImagePopover.PageHeader).waitForExistence(timeout: 5)
    }
    
    //
    // MARK: Elements
    //
    
    private var copyButton: XCUIElement { return app.cells[AXSaveImagePopover.CopyButton] }
    private var saveImageButton: XCUIElement { return app.cells[AXSaveImagePopover.SaveImageButton] }
    private var assignToContactButton: XCUIElement { return app.cells[AXSaveImagePopover.AssignToContactButton] }
    private var saveToFilesButton: XCUIElement { return app.cells[AXSaveImagePopover.SaveToFilesButton ] }
    private var printButton: XCUIElement { return app.cells[AXSaveImagePopover.PrintButton ] }
    
    //
    // MARK: Actions
    //
    
    @discardableResult
    func tapSaveImageButton() -> SaveFinishedAlertView {
        
        if saveImageButton.waitForExistence(timeout: 3) && saveImageButton.isHittable {
            saveImageButton.tap()
        } else {
            XCTFail("Unable to tap save button")
        }
        
        //NOTE: System Alerts have to be disabled prior to running UITests
        
        // System alert is shown every first time the app is built on a simulator. Using Below dismiss function dismisses the alert but does not open Save Finished Alert view. This has to be handled (Possible UI glitch)
        
        // HandleSystemAlert().dismissSystemAlert()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            _ = SaveFinishedAlertView().alertViewIpad.waitForExistence(timeout: 5)
        } else {
            _ = SaveFinishedAlertView().alertViewIphone.waitForExistence(timeout: 5)
        }
        return SaveFinishedAlertView()
    }
    
    @discardableResult
    func tapSaveToFilesButton() -> SaveImagePopoverView {
        
        if saveToFilesButton.waitForExistence(timeout: 3) && saveToFilesButton.isHittable {
            saveToFilesButton.tap()
        } else {
            XCTFail("Unable to tap save to files button")
        }
        return self
    }
    
    //
    // MARK: Assertions
    //
    
    @discardableResult
    func assertSaveImageButtonExists() -> SaveImagePopoverView {
        
        _ = saveImageButton.waitForExistence(timeout: 3)
        XCTAssertTrue(saveImageButton.exists, "Save Image button does not exist")
        return self
    }
    
    @discardableResult
    func assertShreddedArtFormatAsImage() -> SaveImagePopoverView {
        
        XCTAssertTrue(!app.staticTexts["GIF Image"].exists, "Unexpected GIF format is shown while saving image")
        return self
    }
    
}

