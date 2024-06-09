// P30~P32

class Character {

    static private var _allCharacters: [Character] = []

    private(set) var priority: Int
    
    init(priority: Int) {
        self.priority = priority
        Character._allCharacters.append(self)
    }
    
    deinit {
        guard let index = Character._allCharacters.firstIndex(where: { $0 === self }) else {
            return
        }
        _ = Character._allCharacters.remove(at: index)
    }
    
    static var allCharacters: [Character] {
        _allCharacters.sorted(by: { $0.priority < $1.priority })
    }
}

// 検証用
extension [Character] {
    var descriptionPriorities: String {
        map({ $0.priority.description }).joined(separator: ", ")
    }
}

// 10人のキャラクタをランダムに生成した配列
let characters = (1...10).map { _ in
    Character(priority: Int.random(in: (0...1000)))
}
// 生成したキャラクタ達の配列のpriorityをそのまま表示
print(characters.descriptionPriorities)
// Character.allCharactersのpriorityを表示(正しくソートされている)
print(Character.allCharacters.descriptionPriorities)
