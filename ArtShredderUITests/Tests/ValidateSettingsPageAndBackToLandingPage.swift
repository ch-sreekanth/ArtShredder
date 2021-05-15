//
//  ValidateSettingsPageAndBackToLandingPage.swift
//  ArtShredderUITests
//
//  Created by Sreekanth Chavali on 5/15/21.
//  Copyright © 2021 marty-suzuki. All rights reserved.
//

import Foundation

class ValidateSettingsPageAndBackToLandingPage: ArtShredderBaseUITests {

    func testValidateSettingsPageAndBackToLandingPage() {

        artShredderLandingScreen()
            .tapMoreInfoButton()
            .assertDoneButtonExists()
            .tapDoneButtonReturnToLandingScreen()
            .assertARModeButton(exists: true)
    }
}
