//
//  Algorithms.swift
//  Swiftly Test Your Might
//
//  Created by Xavier Lian on 4/10/18.
//  Copyright © 2018 BinaryFuel. All rights reserved.
//

import Foundation

func algorithm1(_ str: String) -> Character?
{
  
    print("Running algorithm1!")

    var chars = [Character]()
    
    for char in str {
        //checks if the character has already appeared. If so, it returns it, if not, it adds it to the array
        if chars.contains(char) {
            return char
        }

        chars.append(char)
    }

    return nil
}

func algorithm2(_ wheels: [Wheel?]) -> [Wheel?]
{
    print("Running algorithm2!")
    return [Wheel]()
}

func algorithm3(_ wheels: [Wheel?]) -> [Date]
{
    print("Running algorithm3!")
    return [Date]()
}

func algorithm4(_ json: Data) -> [Spinach]
{
    print("Running algorithm4!")
    return [Spinach]()
}
struct Spinach: Codable
{
    print("Running algorithm5!")
    let fresh: Bool
    let variety: String
}

func lastAlgorithm(_ data: Data) -> [Wheel]
{
    print("Running last algorithm!")
    return [Wheel]()
}
