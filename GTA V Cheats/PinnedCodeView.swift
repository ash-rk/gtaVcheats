//
//  PinnedcodeView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 02/08/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//

import SwiftUI

struct PinnedCodeView: View {
    struct Information: Codable {
        let effect: String
        let cheat: String
    }
    
    let codeInformation: Information
    
    init(pinnedcode: Cheatcode.Details) {
        let code = pinnedcode
        let cheat = code.cheat
        let effect = code.effect
        let retrieved: Information = Information(effect: effect, cheat: cheat)
        self.codeInformation = retrieved
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 10) {
                Text(codeInformation.effect)
                    .font(.title2)
                  // .padding(.bottom, 5)
                //Spacer()
                //Text(codeInformation.cheat) //for PC
                if codeInformation.cheat.starts(with: "1") {
                    Text(codeInformation.cheat)//.padding(.bottom, 5)  //for PC
                } else {
                    SplitTextView(input: codeInformation.cheat)
                    .font(.title)//.padding(.bottom, 5)
                }
            }
        }
    }
}

struct PinnedCodeView_Previews: PreviewProvider {
    static let cheatcodes: [Cheatcode] = Bundle.main.decode("xboxcheatcodes.json")
    static var previews: some View {
        PinnedCodeView(pinnedcode: cheatcodes[2].details[0])
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
