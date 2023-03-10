//
//  GTA_V_CheatsApp.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 24/07/20.
//

import SwiftUI

@main
struct GTA_V_CheatsApp: App {
    var pins = Pins()
    var body: some Scene {
        WindowGroup {
            MenuView().environmentObject(pins)
        }
    }
}

//MARK: BACKUP
//import SwiftUI
//
//@main
//struct GTA_V_CheatsApp: App {
//    var pins = Pins()
//    var body: some Scene {
//        WindowGroup {
//            MenuView().environmentObject(pins)
//        }
//    }
//}

