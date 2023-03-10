//
//  SplitTextView.swift
//  DemoSwiftUI-2
//
//  Created by Ashwin Ravikumar on 24/07/20.
//

import SwiftUI

struct SplitTextView: View {
    let input: String
    let buttonKeys: [String]
    
    init(input: String) {
        self.input = input
        let buttonKeys = input.components(separatedBy: ", ")
        self.buttonKeys = buttonKeys
    }
    
    let layout = [GridItem(.adaptive(minimum: 35))]
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: 20) {
            ForEach(0..<self.buttonKeys.count, id: \.self) { index in
                ButtonGeneratorView(buttonKey: buttonKeys[index])
            }
        }
    }
}

struct ButtonGeneratorView: View {
    
    let buttonKey: String
    let color: [String : Color] = ["Y" : Color.yellow,
                                   "B" : Color.red,
                                   "A" : Color.green,
                                   "X" : Color.blue,
                                   
                                   "Square" : Color.pink,
                                   "Triangle" : Color.green,
                                   "Circle" : Color.red,
                                   "cross" : Color.blue
    ]
    
    let trigger: [String : String] = ["LB" : "lb.rectangle.roundedbottom.fill",
                                      "RB" : "rb.rectangle.roundedbottom.fill",
                                      
                                      "LT" : "lt.rectangle.roundedtop.fill",
                                      "RT" : "rt.rectangle.roundedtop.fill",
                                      
                                      "L1" : "l1.rectangle.roundedbottom.fill",
                                      "R1" : "r1.rectangle.roundedbottom.fill",
                                      
                                      "L2" : "l2.rectangle.roundedtop.fill",
                                      "R2" : "r2.rectangle.roundedtop.fill"
    ]
    
    let directionals: [String : String] = ["Left" : "dpad.left.fill",
                                           "Top" : "dpad.up.fill",
                                           "Right" : "dpad.right.fill",
                                           "Down" : "dpad.down.fill"
    ]
    
    let shapes: [String : String] = ["Square" : "square.circle",
                                     "Triangle" : "triangle.circle",
                                     "Circle" : "circle.circle",
                                     "Cross" : "x.circle"
    ]
    
    var body: some View {
        VStack {
            if buttonKey.count == 1 {
                Image(systemName: "\(buttonKey.lowercased()).circle.fill")
                    .foregroundColor(color["\(buttonKey)"])
            }
            
            else if buttonKey.count == 2 {
                Image(systemName: trigger["\(buttonKey)"]!)
                    .foregroundColor(.gray)
            }
            
            else if shapes.keys.contains(buttonKey) {
                Image(systemName: shapes["\(buttonKey)"]!)
                    .foregroundColor(color["\(buttonKey)"])
            }
            
            else if buttonKey.count >= 2 {
                Image(systemName: directionals["\(buttonKey)"]!)
                    //.foregroundColor(.black)
            }
            
            else {
                Image(systemName: "questionmark.circle.fill")
            }
        }
    }
}

struct SplitTextView_Previews: PreviewProvider {
    static let input = "B, LB, Y, RT, A, X, B, Right, X, LB, LB, LB"
    static let inputPS4 = "Circle, L1, Triangle, R2, Cross, Square, Circle, Right, Square, L1, L1, L1"
    static var previews: some View {
        SplitTextView(input: input)
    }
}
