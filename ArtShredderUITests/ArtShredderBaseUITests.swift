//
//  ArtShredderBaseUITests.swift
//  ArtShredderBaseUITests
//
//  Created by Sreekanth Chavali on 5/14/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import XCTest

class ArtShredderBaseUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        //Any other common test set up can be performed here
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        
        //Any tear down activity for tests can be performed here
    }
    
    @discardableResult
    func artShredderLandingScreen() -> LandingPage {
        
        app.launch()
        XCTAssertTrue(app.element(matchingIdentifier: AXLandingScreen.ARModeButton).exists, "Page Load Issue")
        return LandingPage()
    }
    
}
