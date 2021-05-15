//
//  XCUIApplication+Additions.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import XCTest

public var app = XCUIApplication()

/// This extension to `XCUIApplication` provides convenience methods
extension XCUIApplication {
    
    public func element(matchingIdentifier identifier: String) -> XCUIElement {
        return app.descendants(matching: .any).matching(identifier: identifier).element(boundBy: 0)
    }
    
}
