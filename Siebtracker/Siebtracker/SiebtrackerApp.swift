//
//  SiebtrackerApp.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI
import CoreData

@main
struct SiebtrackerApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
