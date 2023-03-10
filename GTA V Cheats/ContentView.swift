//
//  ContentView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 18/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let cheatcodes: [Cheatcode]
    let device: String
    @StateObject var pinned = Pins()
    @EnvironmentObject var pins: Pins
    
    var body: some View {
        
            List {
                Section (header: Text("Pinned Cheats")) {
                    NavigationLink(destination: PinnedView(device: device)) {
                        Text("Your pinned cheats")
                    }
                }
//                else {
//                    if let index = pins.items.firstIndex(where: {
//                        $0.effect == codeInformation.effect && $0.device == device
//                    }) {
//                        pins.items.remove(at: index)
//                    }
//                    isPinned = false
//                }
                ForEach(cheatcodes) { cheatcode in
                    Section (header: Text(cheatcode.category)) {
                        ForEach(0..<cheatcode.details.count) {number in
                            //let pinnedStatus = checkIfPinned(device: device, effect: cheatcode.details[number].effect)
                            CheatcodeView(cheatcode: cheatcode.details[number], device: device).environmentObject(pins)
                        }//.padding([.top, .bottom], 10)
                    }
                }
            }.listStyle(InsetListStyle())
            
            .navigationBarTitle(Text("\(device) Cheats"),displayMode: .automatic)
    }
    
    func checkIfPinned(device: String, effect: String) -> Bool {
        let check = pins.items.contains(where: { item in
            if item.effect == effect && item.device == device {
                return true
            } else {
                return false
            }
        })
        return check
    }
}

struct ContentView_Previews: PreviewProvider {
    static let cheatcodes: [Cheatcode] = Bundle.main.decode("xboxcheatcodes.json")
    static let pins = Pins()
    static var previews: some View {
        ContentView(cheatcodes: cheatcodes, device: "Xbox").environmentObject(pins)
    }
}

/*
 struct ContentView: View {
     
     let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
     let cheatcodes2: [Cheatcode2] = Bundle.main.decode("cheatcodes2.json")
     @State private var pinnedID = [Int]()
     @State private var isPinned = false
     
     var body: some View {
         NavigationView {
             List {
                 ForEach(cheatcodes) { cheatcode in
                     Section(header: Text(cheatcode.category)) {
                         HStack {
                             VStack (alignment: .leading, spacing: 6) {
                                 Text(cheatcode.effect)
                                     .font(.headline)
                                 Text(cheatcode.cheat)
                             }
                             Spacer()
                             self.pinImage()
                         }
                     }
                 }
             }
         .navigationBarTitle("GTA V Cheats")
         }
     }
     
     func pinImage() -> Image {
         if isPinned {
             return Image(systemName: "pin.fill")
         }
         return Image(systemName: "pin")
     }
 }
 */

//MARK: - BETA 1
//
//  ContentView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 18/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//
//
//import SwiftUI
//
//struct ContentView: View {
//
//    let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(cheatcodes) { cheatcode in
//                    Section (header: Text(cheatcode.category)) {
//                        HStack {
//                            CheatcodeView(cheatcode: cheatcode)
//                        }
//                    }
//                }
//            }
//        .navigationBarTitle("GTA V Cheats")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//MARK: - BETA 2

//
//  ContentView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 18/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(cheatcodes) { cheatcode in
//                    Section (header: Text("\(cheatcode.category)")) {
//                        CheatcodeView(cheatcode: cheatcode)
//                    }
//                }
//            }
//        .navigationBarTitle("GTA V Cheats")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
