//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        return hand!.contains(card)
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for (key, value) in table {
            if hand!.contains(key) || hand!.contains(value) {
                return true
            }
        }
        return false
    }
}
