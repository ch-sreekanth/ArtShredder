//
//  VerifyLandingScreen.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation

class VerifyLandingScreen: ArtShredderBaseUITests {

    func testVerifyLandingScreenContent() {
        
        artShredderLandingScreen()
            .assertARModeButton(exists: true)
            .assertMoreInfoButton(exists: true)
            .assertSaveAsGifButton(exists: true)
            .assertSaveAsImageButton(exists: true)
            .assertSaveAsImageButton(exists: true)
            .assertARModeButton(isEnabled: true)
            .assertSaveAsGifButton(isEnabled: false)
            .assertSaveAsImageButton(isEnabled: false)
            .assertMoreInfoButton(isHittable: true)
    }
}
