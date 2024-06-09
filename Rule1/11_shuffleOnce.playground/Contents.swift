// P16~P17

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
func copyCard(destinationCards: [Card], sourceCards: [Card], sourceIndex: Int) -> (newDestinationCards: [Card], newIndex: Int) {
    var destinationCards = destinationCards
    destinationCards.append(sourceCards[sourceIndex])
    return (destinationCards, sourceIndex + 1)
}

// 書籍のコード
func copyCards(destinationCards: [Card], sourceCards: [Card], sourceIndex: Int, endIndex: Int) -> [Card] {
    var destinationCards = destinationCards
    var sourceIndex = sourceIndex
    while sourceIndex < endIndex {
        (destinationCards, sourceIndex) = copyCard(destinationCards: destinationCards, sourceCards: sourceCards, sourceIndex: sourceIndex)
    }
    return destinationCards
}
// 書籍のコード
func shuffleOnce(cards: [Card]) -> [Card] {
    var shuffledCards: [Card] = []
    let splitIndex = cards.count / 2
    var leftIndex = 0
    var rightIndex = splitIndex
    
    while true {
        // 終了条件
        // 左右のどちらかが選択し終わったら残り側のカードを全部入れる
        if leftIndex >= splitIndex {
            shuffledCards = copyCards(destinationCards: shuffledCards, sourceCards: cards, sourceIndex: rightIndex, endIndex: cards.count)
            break
        } else if rightIndex >= cards.count {
            shuffledCards = copyCards(destinationCards: shuffledCards, sourceCards: cards, sourceIndex: leftIndex, endIndex: splitIndex)
            break
        }
        
        // 左右からランダムに選ぶ
        if Bool.random() {
            (shuffledCards, rightIndex) = copyCard(destinationCards: shuffledCards, sourceCards: cards, sourceIndex: rightIndex)
        } else {
            (shuffledCards, leftIndex) = copyCard(destinationCards: shuffledCards, sourceCards: cards, sourceIndex: leftIndex)
        }
    }
    return shuffledCards
}

// 書籍のコード
func shuffle(cards: [Card]) -> [Card] {
    var shuffledCards = cards
    for _ in (1...7) {
        shuffledCards = shuffleOnce(cards: shuffledCards)
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
