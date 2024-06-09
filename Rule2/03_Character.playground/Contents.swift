// P27~P30

class Character {

    static private(set) var allCharacters: [Character] = []

    private(set) var priority: Int {
        didSet {
            if priority == oldValue {
                return
            }
                        
            while index > 0 {
                var character = Character.allCharacters[index - 1]
                if character.priority <= priority {
                    break
                }
                
                Character.allCharacters[index] = character
                character.index = index
                
                index -= 1
            }
            
            while index + 1 < Character.allCharacters.count {
                var character = Character.allCharacters[index + 1]
                if character.priority >= priority {
                    break
                }
                
                Character.allCharacters[index] = character
                character.index = index
                
                index += 1
            }
            
            Character.allCharacters[index] = self
        }
    }
    
    private var index: Int = 0
    
    init(priority: Int) {
        self.priority = priority
        
        let insertIndex = Character.allCharacters.firstIndex(where: {
             priority <= $0.priority
        }) ?? 0
        
        Character.allCharacters.insert(self, at: insertIndex)
        
        for newIndex in (insertIndex..<Character.allCharacters.count) {
            Character.allCharacters[newIndex].index = newIndex
        }
    }
    
    deinit {
        Character.allCharacters.remove(at: index)

        for newIndex in (index..<Character.allCharacters.count) {
            Character.allCharacters[newIndex].index = newIndex
        }
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
