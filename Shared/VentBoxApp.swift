//  VentBoxApp.swift
//  Shared
//
//  Created by Jason He on 3/11/22.
//

import SwiftUI
import Firebase

@main
struct VentBoxApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
