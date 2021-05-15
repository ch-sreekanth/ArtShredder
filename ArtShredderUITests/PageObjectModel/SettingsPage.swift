//
//  SettingsPage.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class SettingsPage: ArtShredderPageObject {
    
    override var isDesiredPage: Bool {
        return app.navigationBars.matching(identifier: AXSettingsPage.NavigationHeader).element.waitForExistence(timeout: 3)
    }
    
    //
    // MARK: Elements
    //
    
    private var doneButton: XCUIElement { return app.element(matchingIdentifier: AXSettingsPage.DoneButton)}
    
    //
    // MARK: Actions
    //
    
    @discardableResult
    func tapDoneButtonReturnToLandingScreen() -> LandingPage {
        
        if doneButton.waitForExistence(timeout: 3) && doneButton.isHittable {
            doneButton.tap()
        } else {
            XCTFail("Unable to tap Done button")
        }
        return LandingPage()
    }
    
    
    //
    // MARK: Assertions
    //
    
    @discardableResult
    func assertDoneButtonExists() -> SettingsPage {
        
        _ = doneButton.waitForExistence(timeout: 3)
        XCTAssertTrue(doneButton.exists, "Done Button does not exist")
        return SettingsPage()
    }
}
