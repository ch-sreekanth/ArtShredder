//
//  PhotoLibraryPage.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation
import XCTest

class PhotoLibraryPage: ArtShredderPageObject {

    override var isDesiredPage: Bool {
        return app.element(matchingIdentifier: AXPhotoLibraryPage.NavigationHeaderElement).waitForExistence(timeout: 5)
    }

    //
    // MARK: Elements
    //
    
    var cancelButton: XCUIElement {
        return app.element(matchingIdentifier: AXPhotoLibraryPage.CancelButton)
    }

    fileprivate var momentsCell: XCUIElement {
        return app.element(matchingIdentifier: AXPhotoLibraryPage.MomentsCell)
    }

    fileprivate var allPhotosCell: XCUIElement {
        return app.element(matchingIdentifier: AXPhotoLibraryPage.AllPhotosCell)
    }

    fileprivate var recentsCell: XCUIElement {
        return app.element(matchingIdentifier: AXPhotoLibraryPage.RecentsCell)
    }

    fileprivate var screenshotsCell: XCUIElement {
        return app.element(matchingIdentifier: AXPhotoLibraryPage.ScreenshotsCell)
    }

    //
    // MARK: Actions
    //
    
    @discardableResult
    func tapCancelButton() -> PhotoLibraryPage {

        if cancelButton.waitForExistence(timeout: 3) && cancelButton.isHittable {
            cancelButton.tap()
        } else {
            XCTFail("Unable to tap Cancel button on Photo Library page")
        }
        return self
    }

    @discardableResult
    func tapMomentsCell() -> MomentsPhotoCollectionPage {

        if momentsCell.waitForExistence(timeout: 3) && momentsCell.isHittable {
            momentsCell.tap()
        } else {
            XCTFail("Unable to tap Moments Cell on Photo Library page")
        }
        return MomentsPhotoCollectionPage()
    }

    @discardableResult
    func tapAllPhotosCell() -> AllPhotosCollectionPage {

        if allPhotosCell.waitForExistence(timeout: 3) && allPhotosCell.isHittable {
            allPhotosCell.tap()
        } else {
            XCTFail("Unable to tap All Photos Cell on Photo Library page")
        }
        return AllPhotosCollectionPage()
    }

    //
    // MARK: Assertions
    //
    
    /// Asserts an array of elements to be validated on Photo Library Page
    @discardableResult
    func assertElementExists(element: [PhotoLibraryPageElements]) -> PhotoLibraryPage {

        for ele in element {
            _ = ele.rawValue.waitForExistence(timeout: 3)
            XCTAssertTrue(ele.rawValue.exists, "\(ele.rawValue) Button/Cell does not exist")
        }
        return self
    }

}

enum PhotoLibraryPageElements {

    case cancelButton
    case momentsCell
    case allPhotosCell
    case recentsCell
    case screenshotsCell
}

extension PhotoLibraryPageElements {
    
    var rawValue: XCUIElement {
        
        switch self {
        case .cancelButton:
            return PhotoLibraryPage().cancelButton
            
        case .momentsCell:
            return PhotoLibraryPage().momentsCell
            
        case .allPhotosCell:
            return PhotoLibraryPage().allPhotosCell
            
        case .recentsCell:
            return PhotoLibraryPage().recentsCell
            
        case .screenshotsCell:
            return PhotoLibraryPage().screenshotsCell
            
        }
    }
}
