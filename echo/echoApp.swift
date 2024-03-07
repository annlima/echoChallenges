//
//  echoApp.swift
//  echo
//
//  Created by Andrea Lima Blanca on 22/02/24.
//

import SwiftUI

@main
struct echoApp: App {
    
    init() {
        UINavigationBar.appearance().tintColor =  UIColor.colorPrincipal
    }

    
    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
}
