//
//  InearbyApp.swift
//  Inearby
//
//  Created by Alanoud Saleh on 04/08/1444 AH.
//

import SwiftUI

@main
struct InearbyApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(currentView: .constant(0))
                .environmentObject(RPSMultipeerSession(username: "e"))
//Home()
        }
    }
}
