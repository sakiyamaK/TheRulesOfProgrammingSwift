// P15

import Foundation

// 書籍にないデータ構造のトランプ
struct Card {
    enum Suit: CaseIterable {
        case club, diamond, heart, spade
    }
    var suit: Suit
    var number: Int
    
    var description: String {
        "[\(suit): \(number)]"
    }
    
    static var defaultCards: [Card] {
        Card.Suit.allCases.map { suit in
            (1...13).map { number in
                Card(suit: suit, number: number)
            }
        }.flatMap({ $0 })
    }
}
// 表示用のためのextension
extension [Card] {
    var description: String {
        map({ $0.description }).joined(separator: ",")
    }
}

// 書籍のコード
func shuffle(cards: [Card]) -> [Card] {
    var shuffledCards = cards
    for cardIndex in (0..<shuffledCards.count).reversed() {
        let swapIndex = Int.random(in: (0...cardIndex))
        shuffledCards.swapAt(swapIndex, cardIndex)
    }
    return shuffledCards
}

// 検証
// 1~13*4種のカード
let cards = Card.defaultCards

print("シャッフル前")
print(cards.description)

// シャッフル
let shuffledCards = shuffle(cards: cards)

print("シャッフル後")
print(shuffledCards.description)
