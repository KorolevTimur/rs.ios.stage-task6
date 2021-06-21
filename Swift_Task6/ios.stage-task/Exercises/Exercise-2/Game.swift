//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var first = Player()
        var firstCard = Card(suit: .clubs, value: .ace)
        for player in players {
            for card in player.hand! {
                if card.isTrump && card.value.rawValue <= firstCard.value.rawValue {
                    first = player
                    firstCard = card
                }
            }
        }
        return first
    }
}
