//
//  Code.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 19/07/20.
//  Copyright © 2020 Atlantis Elements. All rights reserved.
//

import Foundation


struct Cheatcode: Identifiable, Codable {
    let id: Int
    let category: String
    
    struct Details: Codable {
        let effect: String
        let cheat: String
    }
    
    let details: [Details]
}


// MARK: JSON File
//[
//    {
//        "id": 1,
//        "category": "Player effects",
//        "details": [
//            {
//                "effect": "Give weapons",
//                "cheat": "Y, RT, Left, LB, A, Right, Y, Down, X, LB, LB, LB"
//            },
//            {
//                "effect": "Max health + Armor",
//                "cheat": "B, LB, Y, RT, A, X, B, Right, X, LB, LB, LB"
//            },
//            {
//                "effect": "Invincibility",
//                "cheat": "Right, A, Right, Left, Right, RB, Right, Left, A, Y"
//            },
//            {
//                "effect": "Lower wanted level",
//                "cheat": "RB, RB, B, RT, Right, Left, Right, Left, Right, Left"
//            },
//            {
//                "effect": "Raise wanted level",
//                "cheat": "RB, RB, B, RT, Left, Right, Left, Right, Left, Right"
//            },
//            {
//                "effect": "Special ability recharge",
//                "cheat": "A, A, X, RB, LB, A, Right, Left, A"
//            },
//            {
//                "effect": "Bang bang!",
//                "cheat": "Right, X, A, Left, RB, RT, Left, Right, Right, LB, LB, LB"
//            },
//            {
//                "effect": "Flaming bullets",
//                "cheat": "LB, RB, X, RB, Left, RT, RB, Left, X, Right, LB, LB"
//            },
//            {
//                "effect": "Explosive melee attacks",
//                "cheat": "Right, Left, A, Y, RB, B, B, B, LT"
//            },
//            {
//                "effect": "Super jump",
//                "cheat": "Left, Left, Y, Y, Right, Right, Left, Right, X, RB, RT"
//            },
//            {
//                "effect": "Give parachute",
//                "cheat": "Left, Right, LB, LT, RB, RT, RT, Left, Left, Right, LB"
//            },
//            {
//                "effect": "Skyfall",
//                "cheat": "LB, LT, RB, RT, Left, Right, Left, Right, LB, LT, RB, RT, Left, Right, Left, Right"
//            },
//            {
//                "effect": "Drunk mode",
//                "cheat": "Y, Right, Right, Left, Right, X, B, Left"
//            },
//            {
//                "effect": "Fast Run",
//                "cheat": "Y, Left, Right, Right, LT, LB, X"
//            },
//            {
//                "effect": "Fast swim",
//                "cheat": "Left, Left, LB, Right, Right, RT, Left, LT, Right"
//            },
//            {
//                "effect": "Slow motion aiming",
//                "cheat": "X, LT, RB, Y, Left, X, LT, Right, A"
//            }
//        ]
//    },
//    {
//        "id": 2,
//        "category": "World effects",
//        "details": [
//            {
//                "effect": "Change weather",
//                "cheat": "RT, A, LB, LB, LT, LT, LT, X"
//            },
//            {
//                "effect": "Slidey cars",
//                "cheat": "Y, RB, RB, Left, RB, LB, RT, LB"
//            },
//            {
//                "effect": "Slow motion",
//                "cheat": "Y, Left, Right, Right, X, RT, RB"
//            },
//            {
//                "effect": "Moon gravity",
//                "cheat": "Left, Left, LB, RB, LB, Right, Left, LB, Left"
//            }
//        ]
//    },
//    {
//        "id": 3,
//        "category": "Vehicle",
//        "details": [
//            {
//                "effect": "Spawn BMX",
//                "cheat": "Left, Left, Right, Right, Left, Right, X, B, Y, RB, RT"
//            },
//            {
//                "effect": "Spawn Buzzard",
//                "cheat": "B, B, LB, B, B, B, LB, LT, RB, Y, B, Y"
//            },
//            {
//                "effect": "Spawn Caddy",
//                "cheat": "B, LB, Left, RB, LT, A, RB, LB, B, A"
//            },
//            {
//                "effect": "Spawn Comet",
//                "cheat": "RB, B, RT, Right, LB, LT, A, A, X, RB"
//            },
//            {
//                "effect": "Spawn Limousine",
//                "cheat": "RT, Right, LT, Left, Left, RB, LB, B, Right"
//            },
//            {
//                "effect": "PCJ-600",
//                "cheat": "RB, Right, Left, Right, RT, Left, Right, X, Right, LT, LB, LB"
//            },
//            {
//                "effect": "Spawn Rapid GT",
//                "cheat": "RT, LB, B, Right, LB, RB, Right, Left, B, RT"
//            },
//            {
//                "effect": "Spawn Sanchez",
//                "cheat": "B, A, LB, B, B, LB, B, RB, RT, LT, LB, LB"
//            }
//        ]
//    }
//]
//
