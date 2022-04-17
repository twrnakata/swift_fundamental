//------------------------------------------
// Deinitialization
//------------------------------------------

/*
A deinitializer is called immediately before a class instance is deallocated.
Deinitializers are only available on class types.

deinit จะถูกเรียกตอนที่ instance ถูก deallocate
มีเพียงอันเดียว และไม่สามาถเรียกเองได้ จะถูกเรียกอัตโนมัติ
    deinit {
        // perform the deinitialization
    }

*/


//------------------------------------------
// Deinitializers in Action
//------------------------------------------

/*
    class Bank {
        static var coinsInBank = 10_000
        static func distribute(coins numberOfCoinsRequested: Int) -> Int {
            let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
            coinsInBank -= numberOfCoinsToVend
            return numberOfCoinsToVend
        }
        static func receive(coins: Int) {
            coinsInBank += coins
        }
    }

    class Player {
        var coinsInPurse: Int
        init(coins: Int) {
            coinsInPurse = Bank.distribute(coins: coins)
        }
        func win(coins: Int) {
            coinsInPurse += Bank.distribute(coins: coins)
        }
        deinit {
            Bank.receive(coins: coinsInPurse)
        }
    }


    var playerOne: Player? = Player(coins: 100)
    print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
    // Prints "A new player has joined the game with 100 coins"
    print("There are now \(Bank.coinsInBank) coins left in the bank")
    // Prints "There are now 9900 coins left in the bank"

    playerOne!.win(coins: 2_000)
    print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
    // Prints "PlayerOne won 2000 coins & now has 2100 coins"
    print("The bank now only has \(Bank.coinsInBank) coins left")
    // Prints "The bank now only has 7900 coins left"

    playerOne = nil
    print("PlayerOne has left the game")
    // Prints "PlayerOne has left the game"
    print("The bank now has \(Bank.coinsInBank) coins")
    // Prints "The bank now has 10000 coins"

*/



class PlayerClass{
    var className: String

    init(){
        className = "Novice"
    }
}
class Wizard: PlayerClass{

    override init(){
        super.init()
        className = "Wizard"
    }

    deinit{
        print("Class Changed")
    }
}

var playerYoda: Wizard? = Wizard()


print(playerYoda?.className) // Optional("Wizard")

playerYoda = nil
// Class Changed




class Person {
    var name: String

    convenience init() {
        self.init(name: "[unset]")
    }

    init(name: String){
        self.name = name
        print(name, "was born!")
    }

    func greeting() {
        print("Hello, My Name is \(name)")
    }

    deinit {
        print("Goodbye \(name)")
    }
}

let nonamePerson: Person? = Person()
// [unset] was born!

var luke: Person? = Person(name: "Luke Skywalker")
// Luke Skywalker was born!

luke = nonamePerson
// Goodbye Luke Skywalker

luke?.greeting()
// Hello, My Name is [unset]


print("====")
for _ in 1...2 {
    let person = Person()
    person.greeting()
}
/*
[unset] was born!
Hello, My Name is [unset]
Goodbye [unset]
[unset] was born!
Hello, My Name is [unset]
Goodbye [unset]
*/

// nonamePerson = nil // *error* change 'let' to 'var' to make it mutable



class Basket{
    var fruits: [String] = []

    init(){
        self.fruits.append("init fruits")
        print("added",fruits)
    }

    init(fruits: String){
        self.fruits.append(fruits)
        print("added",fruits)
    }   
    
    deinit{
        if let remove = self.fruits.popLast(){
            print("goodbye", remove)
        }
    }
}


var someBasket: Basket? = Basket()
// added ["init fruits"]
someBasket?.fruits.append("Melon")
someBasket?.fruits.append("Mango")

someBasket = nil // goodbye Mango
print(someBasket?.fruits) // nil





class Melon{
    init(){
        print("Melon was born")
    }

    deinit{
        print("Melon is gone")
    }
}

class MelonBasket{
    static var fruits: Melon? = Melon(){
        didSet{
            print("Melon In MelonBasket")
        }
    }

    init(){
        print("MelonBasket was born")
    }

    deinit{
        print("MelonBasket is gone")
    }

    static func deinitSelf(){
        fruits = nil
    }
}

var melon: MelonBasket? = MelonBasket() // MelonBasket was born

print("===")
MelonBasket.fruits = Melon()
/*
Melon was born // init ของ Melon()
Melon was born // init จากการสร้าง instance ใน MelonBasket
Melon In MelonBasket // fruits ถูกเรียกจาก MelonBasket
Melon is gone // deinit ของ Melon() ไม่ถูกเรียกใช้ จึง deallocate ไม่ได้มาจาก MelonBasket
*/
print("===")
MelonBasket.deinitSelf()
/*
Melon In MelonBasket
Melon is gone // deinit จากใน MelonBasket
*/
MelonBasket.deinitSelf() // Melon In MelonBasket
MelonBasket.deinitSelf() // Melon In MelonBasket
print("=====")

melon = nil // MelonBasket is gone






class MonsterCount{ 
    static var number = 0

    class func getNumber() -> Int{
        return number
    }
}

class Monster{
    var name: String
    init(){
        self.name = "[Unset]"
        MonsterCount.number += 1
    }
    deinit{
        print(self.name, "is gone")
        MonsterCount.number -= 1
    }
}

class Boss:Monster{
    var types: String
    override init(){
        self.types = "Low level Boss"
    }
    init(name: String, types: String){
        self.types = types
        super.init()

        self.name = name
    }
    
    func printInfo(){
        print(self.name,":", self.types)
    }

    deinit{
        print("Boss has been defeat")
    }
}


print(MonsterCount.getNumber()) // 0
var shina: Boss? = Boss()
shina?.printInfo() // [Unset] : Low level Boss

var olivia: Boss? = Boss(name: "olivia", types: "High Level Boss")
olivia?.printInfo() // olivia : High Level Boss

print(MonsterCount.getNumber()) // 2


var tia = Boss(name: "Tia", types: "Some Level")
shina = nil
/*
Boss has been defeat
[Unset] is gone
*/

print(MonsterCount.getNumber()) // 2

olivia = nil
/*
Boss has been defeat
olivia is gone
*/
print(MonsterCount.getNumber()) // 1




//------------------------------------------
// 
//------------------------------------------



class Library {
    static var books: [String] = ["Ai Super Power", "What money can buy?", "The Dragon cant Fly", "Anybody can be anyone"]

}

class Bookworm{
    var name: String
    var books: [String] = []

    init(name: String){
        self.name = name
    }

    func borrowBook(){
        if (Library.books.count > 0){
            self.books.append(Library.books.removeFirst())
        }else{
            print("no more book")
        }
    }
    
    deinit{
        for book in books{
            Library.books.append(book)
        }
    }
}


var breadman: Bookworm? = Bookworm(name: "Breadman")
breadman?.borrowBook()
breadman?.borrowBook()
print(breadman!.books) // ["Ai Super Power", "What money can buy?"]
print(Library.books) // ["The Dragon cant Fly", "Anybody can be anyone"]

breadman = nil
print(Library.books) // ["The Dragon cant Fly", "Anybody can be anyone", "Ai Super Power", "What money can buy?"]


var dragon: Bookworm? = Bookworm(name: "Dragon")
let champ: Bookworm? = Bookworm(name: "Champ")
dragon?.borrowBook()
champ?.borrowBook()
print(Library.books) // ["Ai Super Power", "What money can buy?"]
champ?.borrowBook()
champ?.borrowBook()
champ?.borrowBook()
// no more book
print(Library.books) // []

dragon = nil

print(Library.books) // ["The Dragon cant Fly"]
champ?.borrowBook()
print(champ!.books) // ["Anybody can be anyone", "Ai Super Power", "What money can buy?", "The Dragon cant Fly"]

champ?.borrowBook() // no more book
print(Library.books) // []


