//
//  VerifyImageSelectionToShredFromAllPhotos.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation

class VerifyImageSelectionToShredFromAllPhotos: ArtShredderBaseUITests {
    
    /// Test to validate art shredding by selecting a photo from `All Photos` collection
    func testVerifyImageSelectionToShredFromAllPhotos() {
        
        artShredderLandingScreen()
            .tapSelectToAddArtWindow()
            .assertElementExists(element: [.cancelButton, .momentsCell, .allPhotosCell, .recentsCell])
            .tapAllPhotosCell()
            .assertBackButtonExists()
            .assertCancelButtonExists()
            .selectImageToShredAt(cellIndex: 2)
            .assertShredingComplete()
            .assertSaveAsGifButton(isEnabled: true)
            .assertSaveAsImageButton(isEnabled: true)
    }
}
