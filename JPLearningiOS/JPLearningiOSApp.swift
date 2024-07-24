//
//  JPLearningiOSApp.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

@main
struct JPLearningiOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
