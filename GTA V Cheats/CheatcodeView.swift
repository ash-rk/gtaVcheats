//
//  CheatcodeView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 20/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//

import SwiftUI

struct CheatcodeView: View {
    struct Information: Codable {
        let effect: String
        let cheat: String
    }
    
    let codeInformation: Information
    let device: String
    @EnvironmentObject var pins: Pins
    
    init(cheatcode: Cheatcode.Details, device: String) {
        let code = cheatcode
        let cheat = code.cheat
        let effect = code.effect
        let retrieved: Information = Information(effect: effect, cheat: cheat)
        self.codeInformation = retrieved
        self.device = device
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 5) {
                HStack {
                    Text(codeInformation.effect)
                        .font(.title2)
                    Spacer()
                    let isPinned = pins.items.contains(where: { item in
                        if item.effect == codeInformation.effect && item.device == device {
                            return true
                        } else {
                            return false
                        }
                    })
                    Image(systemName: isPinned ? "pin.fill" : "pin")
                        .font(.headline)
                        .foregroundColor(.red)
                        .onTapGesture {
                            if !isPinned {
                                let data = PinnedItem(device: device, effect: codeInformation.effect, cheat: codeInformation.cheat)
                                pins.items.append(data)
                            }
                            
                            else {
                                if let index = pins.items.firstIndex(where: {
                                    $0.effect == codeInformation.effect && $0.device == device
                                }) {
                                    pins.items.remove(at: index)
                                }
                            }
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                //Text(codeInformation.cheat) //for PC
                if codeInformation.cheat.starts(with: "1") {
                    Text(codeInformation.cheat).padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/) //for PC
                } else {
                    SplitTextView(input: codeInformation.cheat)
                    .font(.title).padding(.bottom, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/) 
                }
            }
        }
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

struct CheatcodeView_Previews: PreviewProvider {
    static let cheatcodes: [Cheatcode] = Bundle.main.decode("xboxcheatcodes.json")
    static var previews: some View {
        CheatcodeView(cheatcode: cheatcodes[2].details[0], device: "Xbox").environmentObject(Pins())
    }
}


//MARK: - BETA 1
//
//  CheatcodeView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 20/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//

//import SwiftUI
//
//struct CheatcodeView: View {
//    struct Information: Codable {
//        let effect: String
//        let cheat: String
//    }
//
//    let codeInformation: [Information]
//
//    init(cheatcode: Cheatcode) {
//        let count = cheatcode.details.count
//        var retrieved = [Information]()
//        for i in (0..<count) {
//            let code = cheatcode.details[i]
//            let effect = code.effect
//            let cheat = code.cheat
//            retrieved.append(Information(effect: effect, cheat: cheat))
//        }
//        self.codeInformation = retrieved
//    }
//
//    var body: some View {
//        VStack {
//            ForEach(0..<codeInformation.count) { number in
//                HStack {
//                    VStack (alignment: .leading, spacing: 10){
//                        Text(self.codeInformation[number].effect).font(.headline)
//                        Text(self.codeInformation[number].cheat)
//                    }
//                    Spacer()
//                    Image(systemName: "pin")
//                }
//            }
//        }
//    }
//}
//
//struct CheatcodeView_Previews: PreviewProvider {
//    static let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
//    static let number = 3
//    static var previews: some View {
//        CheatcodeView(cheatcode: cheatcodes[0])
//    }
//}


//MARK: - BETA 2
//
//  CheatcodeView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 20/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//
//
//import SwiftUI
//
//struct CheatcodeView: View {
//    struct Information: Codable {
//        let effect: String
//        let cheat: String
//    }
//
//    let codeInformation: [Information]
//
//    init(cheatcode: Cheatcode) {
//        let count = cheatcode.details.count
//        var retrieved = [Information]()
//        for i in (0..<count) {
//            let code = cheatcode.details[i]
//            let effect = code.effect
//            let cheat = code.cheat
//            retrieved.append(Information(effect: effect, cheat: cheat))
//        }
//        self.codeInformation = retrieved
//    }
//
//    var body: some View {
//        VStack {
//            ForEach(0..<codeInformation.count) { number in
//                HStack {
//                    VStack (alignment: .leading, spacing: 10){
//                        Text(self.codeInformation[number].effect)
//                            .font(.headline)
//                            .lineLimit(3)
//                        Text(self.codeInformation[number].cheat)
//                        .lineLimit(3)
//                    }
//                    Spacer()
//                    Image(systemName: "pin")
//                }
//            }
//        }
//    }
//}
//
//struct CheatcodeView_Previews: PreviewProvider {
//    static let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
//    static let number = 3
//    static var previews: some View {
//        CheatcodeView(cheatcode: cheatcodes[0])
//    }
//}


//MARK: - BETA 3
//
//  CheatcodeView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 20/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//
//
//import SwiftUI
//
//struct CheatcodeView: View {
//    struct Information: Codable {
//        let effect: String
//        let cheat: String
//    }
//
//    let codeInformation: [Information]
//    let category: String
//
//    init(cheatcode: Cheatcode) {
//        let count = cheatcode.details.count
//        var retrieved = [Information]()
//        let category = cheatcode.category
//        for i in (0..<count) {
//            let code = cheatcode.details[i]
//            let effect = code.effect
//            let cheat = code.cheat
//            retrieved.append(Information(effect: effect, cheat: cheat))
//        }
//        self.codeInformation = retrieved
//        self.category = category
//    }
//
//    var body: some View {
//        VStack {
//            //Text(self.category)
//            ForEach(0..<codeInformation.count, id: \.self) { number in
//                HStack {
//                    VStack (alignment: .leading, spacing: 10){
//                        Text(self.codeInformation[number].effect)
//                            .font(.headline)
//                        Text(self.codeInformation[number].cheat)
//                    }.padding(5)
//                    Spacer()
//                    Image(systemName: "pin")
//                }
//            }
//        }
//    }
//}
//
//struct CheatcodeView_Previews: PreviewProvider {
//    static let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
//    static let number = 3
//    static var previews: some View {
//        CheatcodeView(cheatcode: cheatcodes[2])
//    }
//}
//

//MARK: BEST BETA 4
//import SwiftUI
//
//struct CheatcodeView: View {
//    struct Information: Codable {
//        let effect: String
//        let cheat: String
//    }
//
//    let codeInformation: Information
//
//    init(cheatcode: Cheatcode.Details) {
//        let code = cheatcode
//        let cheat = code.cheat
//        let effect = code.effect
//        let retrieved: Information = Information(effect: effect, cheat: cheat)
//        self.codeInformation = retrieved
//    }
//
//    var body: some View {
//        HStack {
//            VStack (spacing: 5) {
//                Text(codeInformation.effect).font(.title)
//                Text(codeInformation.cheat)
//            }
//            Spacer()
//            Image(systemName: "pin").font(.system(size: 32))
//        }.padding(10)
//    }
//}
//
//struct CheatcodeView_Previews: PreviewProvider {
//    static let cheatcodes: [Cheatcode] = Bundle.main.decode("cheatcodes.json")
//    static var previews: some View {
//        CheatcodeView(cheatcode: cheatcodes[2].details[0])
//    }
//}


//MARK: BETA 5
//import SwiftUI
//
//struct CheatcodeView: View {
//    struct Information: Codable {
//        let effect: String
//        let cheat: String
//    }
//
//    let codeInformation: Information
//    let device: String
//    @State private var isPinned: Bool = false
//    @EnvironmentObject var pins: Pins
//
//    init(cheatcode: Cheatcode.Details, device: String) {
//        let code = cheatcode
//        let cheat = code.cheat
//        let effect = code.effect
//        let retrieved: Information = Information(effect: effect, cheat: cheat)
//        self.codeInformation = retrieved
//        self.device = device
//    }
//
//    let deviceCode = ["Computer" : 0,
//                      "Xbox" : 1,
//                      "Playstation" : 2
//    ]
//
//    var body: some View {
//        HStack {
//            VStack (alignment: .leading, spacing: 5) {
//                HStack {
//                    Text(codeInformation.effect)
//                        .font(.title2)
//                    Spacer()
//                    Image(systemName: isPinned ? "pin.fill" : "pin")
//                        .font(.headline)
//                        .foregroundColor(.red)
//                        .onTapGesture {
//                            let deviceID = deviceCode[device]!
//                            if !isPinned {
//                                let cheatDetails = PinnedItem.CheatDetails(effect: codeInformation.effect, code: codeInformation.cheat)
//                                if pins.item.isEmpty {
//                                    //pins.item[deviceID].device = device
//                                    pins.item[deviceID].device.append(device)
//                                }
//                                pins.item[deviceID].details.append(cheatDetails)
//                                isPinned = true
//                            }
//
//                            else if isPinned {
////                                isPinned = pins.item[deviceID].details.contains { detail in
////                                    if detail.effect == codeInformation.effect {
////
////                                        return true
////                                    } else {
////                                        return false
////                                    }
////                                }
//                                if let index = pins.item[deviceID].details.firstIndex(where: {
//                                    $0.effect == codeInformation.cheat
//                                }) {
//                                    pins.item[deviceID].details.remove(at: index)
//                                }
//
//                                isPinned = false
//                            }
//                        }
//                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                }
//                //Text(codeInformation.cheat) //for PC
//                if codeInformation.cheat.starts(with: "1") {
//                    Text(codeInformation.cheat) //for PC
//                } else {
//                    SplitTextView(input: codeInformation.cheat)
//                    .font(.title)
//                }
//            }
//        }
//    }
//}
//
//struct CheatcodeView_Previews: PreviewProvider {
//    static let cheatcodes: [Cheatcode] = Bundle.main.decode("xboxcheatcodes.json")
//    static let pins = Pins()
//    static var previews: some View {
//        CheatcodeView(cheatcode: cheatcodes[2].details[0], device: "Xbox").environmentObject(pins)
//    }
//}
