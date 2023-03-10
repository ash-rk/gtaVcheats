//
//  PinnedView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 01/08/20.
//

import SwiftUI

struct PinnedView: View {
    let device: String
    @EnvironmentObject var pins: Pins
    
    var body: some View {
        
        VStack {
            if pins.items.isEmpty {
                Text("You have not pinned any cheats for \(device)")
                    .navigationTitle("Empty")
            }
            
            else if pins.items.contains(where: { item in
                if item.device == device {
                    return true
                } else {
                    return false
                }
            }) {
                List {
                    ForEach(pins.items) { item in
                        if item.device == device {
                            VStack {
                                let data = Cheatcode.Details(effect: item.effect, cheat: item.cheat)
                                PinnedCodeView(pinnedcode: data)
                            }
                        }
                    }.onDelete(perform: remove)
                    .onMove(perform: move)
                    .padding([.top, .bottom], 5)
                }.listStyle(GroupedListStyle())
                .navigationBarTitle("Pinned Cheats")
            }
                    
            else {
                Text("You have not pinned any cheats for \(device)")
                    .navigationTitle("Empty")
            }
        }
        .navigationBarItems(trailing: EditButton().padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5))
    }
    
    func remove(at offSet: IndexSet) {
        pins.items.remove(atOffsets: offSet)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        pins.items.move(fromOffsets: source, toOffset: destination)
    }
}

struct PinnedView_Previews: PreviewProvider {
    static let pins = Pins()
    static var previews: some View {
        PinnedView(device: "Xbox").environmentObject(pins)
    }
}

struct PinnedItem: Identifiable, Codable {
    var id = UUID()
    let device: String
    let effect: String
    let cheat: String
}

class Pins: ObservableObject {
    @Published var items = [PinnedItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.setValue(encoded, forKey: "Pins")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Pins") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([PinnedItem].self, from: data) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}
