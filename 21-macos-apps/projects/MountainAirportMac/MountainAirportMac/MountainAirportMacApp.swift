//
//  MountainAirportMacApp.swift
//  MountainAirportMac
//
//  Created by 🤨 on 25/05/21.
//

import SwiftUI

@main
struct MountainAirportMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
          SidebarCommands()
        }
    }
}
