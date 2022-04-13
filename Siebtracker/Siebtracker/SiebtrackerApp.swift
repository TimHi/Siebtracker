//
//  SiebtrackerApp.swift
//  Siebtracker
//
//  Created by Tim Hiller on 13.04.22.
//

import SwiftUI

@main
struct SiebtrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
