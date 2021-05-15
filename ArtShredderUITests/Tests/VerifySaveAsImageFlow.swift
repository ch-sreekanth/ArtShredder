//
//  VerifySaveAsImageFlow.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation

class VerifySaveAsImageFlow: ArtShredderBaseUITests {
    
    /// Test to validate art shredding by selecting a photo from `All Photos` collection and saving it as an image
    func testVerifySaveAsImageFlow() {
        
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
            .tapSaveAsImageButton()
            .assertSaveImageButtonExists()
            .tapSaveImageButton()
            .assertSaveFinishedAlertExists()
            .assertMessageOnSaveFinishedAlert()
    }
    
}
