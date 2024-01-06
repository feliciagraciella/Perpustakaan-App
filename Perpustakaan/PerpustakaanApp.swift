//
//  PerpustakaanApp.swift
//  Perpustakaan
//
//  Created by Felicia Graciella on 05/01/24.
//

import SwiftUI

@main
struct PerpustakaanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppState())
                .environmentObject(ViewModel())
        }
    }
}
