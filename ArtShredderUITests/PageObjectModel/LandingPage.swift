//
//  LandingPage.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class LandingPage {
    
    //
    // MARK: Elements
    //
    
    private var moreInfoButton: XCUIElement { return app.buttons["More Info"]}
    private var saveAsGIFButton: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.SaveAsGIFButton)}
    private var saveAsImageButton: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.SaveAsImageButton)}
    private var aRModeButton: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.ARModeButton)}
    private var selectToAddArtWindow: XCUIElement { return app.element(matchingIdentifier: AXLandingScreen.selectToAddArtWindow)}
    
    //
    // MARK: Actions
    //
    
    @discardableResult
    func tapMoreInfoButton() -> LandingPage {
        
        if moreInfoButton.waitForExistence(timeout: 3) && moreInfoButton.isHittable {
            moreInfoButton.tap()
        } else {
            XCTFail("Unable to tap More Info Button")
        }
        return self
    }
    
    @discardableResult
    func tapSelectToAddArtWindow() -> LandingPage {
        
        if selectToAddArtWindow.waitForExistence(timeout: 3) && selectToAddArtWindow.isHittable {
            selectToAddArtWindow.tap()
        } else {
            XCTFail("Unable to tap Select To Add Art Window")
        }
        return self
    }
    
    //
    // MARK: Assertions
    //
    
    @discardableResult
    func assertMoreInfoButton(exists: Bool) -> LandingPage {
        XCTAssertEqual(moreInfoButton.exists, exists, "More Info Button does not exist")
        return self
    }
    
    @discardableResult
    func assertSaveAsGifButton(exists: Bool) -> LandingPage {
        XCTAssertEqual(saveAsGIFButton.exists, exists, "Save As GIF Button does not exist")
        return self
    }
    
    @discardableResult
    func assertSaveAsImageButton(exists: Bool) -> LandingPage {
        XCTAssertEqual(saveAsImageButton.exists, exists, "Save As Image Button does not exist")
        return self
    }
    
    @discardableResult
    func assertARModeButton(exists: Bool) -> LandingPage {
        XCTAssertEqual(aRModeButton.exists, exists, "AR Mode Button does not exist")
        return self
    }
    
    @discardableResult
    func assertSelectToAddArtWindow(exists: Bool) -> LandingPage {
        XCTAssertEqual(selectToAddArtWindow.exists, exists, "Select To Add Art Window does not exist")
        return self
    }
    
    @discardableResult
    func assertARModeButton(isEnabled: Bool) -> LandingPage {
        XCTAssertEqual(aRModeButton.isEnabled, isEnabled, "Mismatch in AR Mode Button enable/disable")
        return self
    }
    
    @discardableResult
    func assertSaveAsGifButton(isEnabled: Bool) -> LandingPage {
        XCTAssertEqual(saveAsGIFButton.isEnabled, isEnabled, "Mismatch in Save As GIF Button enable/disable")
        return self
    }
    
    @discardableResult
    func assertSaveAsImageButton(isEnabled: Bool) -> LandingPage {
        XCTAssertEqual(saveAsImageButton.isEnabled, isEnabled, "Mismatch in Save As Image Button enable/disable")
        return self
    }
    
    @discardableResult
    func assertMoreInfoButton(isHittable: Bool) -> LandingPage {
        XCTAssertEqual(moreInfoButton.isHittable, isHittable, "Mismatch in hittability of More Info Button")
        return self
    }
    
}
