//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Andres de la Cruz on 9/10/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
