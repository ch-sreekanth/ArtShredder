//
//  VerifyArtFormatBeforeSaving.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/16/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation

class VerifyArtFormatBeforeSaving: ArtShredderBaseUITests {
    
    // This is a `negative` test

    ///This test ensures the expected format is being used before saving the shredded art. Save as image would save it in image format vs save as GIF would save it in GIF Image format
    func testVerifyArtFormatBeforeSaving() {
        
        artShredderLandingScreen()
            .tapSelectToAddArtWindow()
            .assertElementExists(element: [.cancelButton, .momentsCell, .allPhotosCell, .recentsCell])
            .tapAllPhotosCell()
            .assertBackButtonExists()
            .assertCancelButtonExists()
            .selectImageToShredAt(cellIndex: 1)
            .assertShredingComplete()
            .assertSaveAsGifButton(isEnabled: true)
            .assertSaveAsImageButton(isEnabled: true)
            .tapSaveAsImageButton()
            .assertSaveImageButtonExists()
            .assertShreddedArtFormatAsImage()
    }
}
