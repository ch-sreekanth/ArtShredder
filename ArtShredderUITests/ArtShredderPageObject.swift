//
//  ArtShredderPageObject.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class ArtShredderPageObject {

    public var isDesiredPage: Bool { return false}

}

class HandleSystemAlert: XCTestCase {
    
    public func dismissSystemAlert() {
        
        addUIInterruptionMonitor(withDescription: "System Dialog") {
            (alert) -> Bool in
            alert.buttons["OK"].tap()
            return true
        }
        app.tap()
    }
}
