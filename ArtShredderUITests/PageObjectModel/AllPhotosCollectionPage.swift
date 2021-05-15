//
//  AllPhotosCollectionPage.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class AllPhotosCollectionPage: ArtShredderPageObject {

    override var isDesiredPage: Bool {
        return app.element(matchingIdentifier: AXAllPhotosCollection.PageHeader).waitForExistence(timeout: 5)
    }

    //
    // MARK: Elements
    //
    
    private var backButton: XCUIElement { return app.buttons.matching(identifier: AXAllPhotosCollection.NavigationBarBackButton).element}

    private var cancelButton: XCUIElement { return app.buttons.matching(identifier: AXAllPhotosCollection.NavigationBarCancelButton).element}

    //
    // MARK: Actions
    //
    
    @discardableResult
    func tapBackButton() -> PhotoLibraryPage {

        if backButton.waitForExistence(timeout: 3) && backButton.isHittable {
            backButton.tap()
        } else {
            XCTFail("Unable to tap Back button")
        }
        return PhotoLibraryPage()
    }

    @discardableResult
    func tapCancelButton() -> LandingPage {

        if cancelButton.waitForExistence(timeout: 3) && cancelButton.isHittable {
            cancelButton.tap()
        } else {
            XCTFail("Unable to tap Cancel button")
        }
        return LandingPage()
    }

    /// Select an image by its index
    @discardableResult
    func selectImageToShredAt(cellIndex: Int) -> LandingPage {

        let imageCell = app.collectionViews.cells.element(boundBy: cellIndex)

        if imageCell.exists && imageCell.isHittable {
            imageCell.tap()
        } else {
            XCTFail("Image does not exist on collection view at index - \(cellIndex)")
        }
        _ = LandingPage().aRModeButton.waitForExistence(timeout: 10)
        return LandingPage()
    }

    //
    // MARK: Assertions
    //
    
    @discardableResult
    func assertCancelButtonExists() -> AllPhotosCollectionPage {
        _ = cancelButton.waitForExistence(timeout: 3)
        XCTAssertTrue(cancelButton.exists, "Cancel Button does not exist")
        return self
    }

    @discardableResult
    func assertBackButtonExists() -> AllPhotosCollectionPage {
        _ = backButton.waitForExistence(timeout: 3)
        XCTAssertTrue(backButton.exists, "Back Button does not exist")
        return self
    }

}
