//
//  Pi_hole_MonitorApp.swift
//  Pi-hole Monitor
//
//  Created by Dev Doshi on 12.06.23.
//

import SwiftUI
import SwiftData

@main
struct Pi_hole_MonitorApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Raspi.self)
    }
}
