//
//  LandingPage.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class LandingPage: ArtShredderPageObject {
    
    override var isDesiredPage: Bool {
        return app.buttons.matching(identifier: AXLandingScreen.MoreInfoButton).element.waitForExistence(timeout: 3)
    }
    
    //
    // MARK: Elements
    //
    
    private var moreInfoButton: XCUIElement { return app.buttons.matching(identifier: AXLandingScreen.MoreInfoButton).element }
    private var saveAsGIFButton: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.SaveAsGIFButton)}
    private var saveAsImageButton: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.SaveAsImageButton)}
    var aRModeButton: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.ARModeButton)}
    private var selectToAddArtWindow: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.selectToAddArtWindow)}
    
    //
    // MARK: Actions
    //
    
    @discardableResult
    func tapMoreInfoButton() -> SettingsPage {
        
        if moreInfoButton.waitForExistence(timeout: 3) && moreInfoButton.isHittable {
            moreInfoButton.tap()
        } else {
            XCTFail("Unable to tap More Info Button")
        }
        return SettingsPage()
    }
    
    @discardableResult
    func tapSelectToAddArtWindow() -> PhotoLibraryPage {
        
        if selectToAddArtWindow.waitForExistence(timeout: 3) && selectToAddArtWindow.isHittable {
            selectToAddArtWindow.tap()
        } else {
            XCTFail("Unable to tap Select To Add Art Window")
        }
        _ = PhotoLibraryPage().cancelButton.waitForExistence(timeout: 10)
        return PhotoLibraryPage()
    }
    
    //
    // MARK: Assertions
    //
    
    @discardableResult
    func assertMoreInfoButton(exists: Bool) -> LandingPage {
        
        _ = moreInfoButton.waitForExistence(timeout: 3)
        XCTAssertEqual(moreInfoButton.exists, exists, "More Info Button does not exist")
        return self
    }
    
    @discardableResult
    func assertSaveAsGifButton(exists: Bool) -> LandingPage {
        
        _ = saveAsGIFButton.waitForExistence(timeout: 3)
        XCTAssertEqual(saveAsGIFButton.exists, exists, "Save As GIF Button does not exist")
        return self
    }
    
    @discardableResult
    func assertSaveAsImageButton(exists: Bool) -> LandingPage {
        
        _ = saveAsImageButton.waitForExistence(timeout: 3)
        XCTAssertEqual(saveAsImageButton.exists, exists, "Save As Image Button does not exist")
        return self
    }
    
    @discardableResult
    func assertARModeButton(exists: Bool) -> LandingPage {
        
        _ = aRModeButton.waitForExistence(timeout: 3)
        XCTAssertEqual(aRModeButton.exists, exists, "AR Mode Button does not exist")
        return self
    }
    
    @discardableResult
    func assertSelectToAddArtWindow(exists: Bool) -> LandingPage {
        
        _ = selectToAddArtWindow.waitForExistence(timeout: 3)
        XCTAssertEqual(selectToAddArtWindow.exists, exists, "Select To Add Art Window does not exist")
        return self
    }
    
    @discardableResult
    func assertARModeButton(isEnabled: Bool) -> LandingPage {
        
        _ = aRModeButton.waitForExistence(timeout: 3)
        XCTAssertEqual(aRModeButton.isEnabled, isEnabled, "Mismatch in AR Mode Button enable/disable")
        return self
    }
    
    @discardableResult
    func assertSaveAsGifButton(isEnabled: Bool) -> LandingPage {
        
        _ = saveAsGIFButton.waitForExistence(timeout: 3)
        XCTAssertEqual(saveAsGIFButton.isEnabled, isEnabled, "Mismatch in Save As GIF Button enable/disable")
        return self
    }
    
    @discardableResult
    func assertSaveAsImageButton(isEnabled: Bool) -> LandingPage {
        
        _ = saveAsImageButton.waitForExistence(timeout: 3)
        XCTAssertEqual(saveAsImageButton.isEnabled, isEnabled, "Mismatch in Save As Image Button enable/disable")
        return self
    }
    
    @discardableResult
    func assertMoreInfoButton(isHittable: Bool) -> LandingPage {
        
        _ = moreInfoButton.waitForExistence(timeout: 3)
        XCTAssertEqual(moreInfoButton.isHittable, isHittable, "Mismatch in hittability of More Info Button")
        return self
    }
    
    @discardableResult
    func assertShredingComplete() -> LandingPage {
        
        while !saveAsGIFButton.isEnabled || !saveAsImageButton.isEnabled {
            sleep(2)
        }
        return self
    }
    
}
