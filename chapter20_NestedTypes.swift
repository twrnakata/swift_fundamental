//------------------------------------------
// Nested Types
//------------------------------------------

//------------------------------------------
// Nested Types in Action
//------------------------------------------

/*
    struct BlackjackCard {

        // nested Suit enumeration
        enum Suit: Character {
            case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
        }

        // nested Rank enumeration
        enum Rank: Int {
            case two = 2, three, four, five, six, seven, eight, nine, ten
            case jack, queen, king, ace
            struct Values {
                let first: Int, second: Int?
            }
            var values: Values {
                switch self {
                case .ace:
                    return Values(first: 1, second: 11)
                case .jack, .queen, .king:
                    return Values(first: 10, second: nil)
                default:
                    return Values(first: self.rawValue, second: nil)
                }
            }
        }

        // BlackjackCard properties and methods
        let rank: Rank, suit: Suit
        var description: String {
            var output = "suit is \(suit.rawValue),"
            output += " value is \(rank.values.first)"
            if let second = rank.values.second {
                output += " or \(second)"
            }
            return output
        }
    }


    let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
    print("theAceOfSpades: \(theAceOfSpades.description)")
    // Prints "theAceOfSpades: suit is ♠, value is 1 or 11"


*/


class Person {
    var health = Health()

    class Health {
        var pulse:Int = 100
        var bmi:Int = 20

        func profile() -> String {
            return "Pulse:\(self.pulse), BMI:\(self.bmi)"
        }
    }
}
let p = Person()
p.health.profile()




struct Livebeing{
    var text = "Livebeing"
    struct Animal{
        var age: Int = 1
        var weight: Int = 10
        struct Mammals{
            var legs: Int = 4
            
            struct Human{
                var legs = 2
            }

            struct Dog{
                var bark: String{
                    return "Bark!"
                }
            }
        }
        struct Bird{
            var wings = 2
            var fly: Bool = true
            struct Chicken{
                var fly = false
            }
        }
    }

    struct Fruit{
        struct Apple{
            var name = "Apple"
        }
    }
}

let someLivebeing = Livebeing()
let someAnimal = Livebeing.Animal()
// var someAnimalDog = someAnimal.Mammals.Dog() // *error*

var someDog = Livebeing.Animal.Mammals.Dog()

print(someLivebeing.text) // Livebeing
// print(someDog.text) // error: value of type 'Livebeing.Animal.Mammals.Dog' has no member 'text'
print(someDog.bark) // Bark!
var someApple = Livebeing.Fruit.Apple()
print(someApple.name) // Apple




class Faculty{
    var name: String?

    init(name: String){
        self.name = name
    }
    func getSection() -> String{
        return "Faculty: \(name)"
    }
}
class Student{
    let studentID: Int
    var studentName: String
    var faculty: Faculty?
    var job = PartTimeJob()
    
    class PartTimeJob{
        var name:String?
        var incomePerHour:Int?
        var hoursToWork: Int?

        var money: Int{
            guard let incomePerHour = incomePerHour, let hoursToWork = hoursToWork else { return 0 }
            return incomePerHour * hoursToWork
        }
        func description() -> String? {
            guard let name = self.name else { return nil }
            return "Job name: \(name), earn \(money) per day(s)"
        }
    }

    init(id: Int, name: String, faculty: Faculty? = nil){
        self.studentID = id
        self.studentName = name
        if let faculty = faculty {
            self.faculty? = faculty
        }
    }

    func getJob(name: String, incomePerHour: Int, workHour: Int){
        self.job.name = name
        self.job.incomePerHour = incomePerHour
        self.job.hoursToWork = workHour
    }

    func show(){
        print("StudentID: \(studentID), StudentName: \(studentName)")
        print(self.faculty?.getSection())
        print(self.job.description())
    }
}

let vivi = Student(id: 6101, name: "Vivi")
print(vivi.faculty) // nil
print(vivi.faculty?.name) // nil
print(vivi.job.description()) // nil

vivi.getJob(name: "Wizard", incomePerHour: 10, workHour: 3)
print(vivi.job.description()) // Optional("Job name: Wizard, earn 30 per day(s)")

print(vivi.job.name) // Optional("Wizard")
print(vivi.job.money) // 30

vivi.faculty = Faculty(name: "Science")
print(vivi.faculty?.name) // Optional("Science")

vivi.show()
/*
StudentID: 6101, StudentName: Vivi
Optional("Faculty: Optional(\"Science\")")
Optional("Job name: Wizard, earn 30 per day(s)")
*/

let psychologyFaculty = Faculty(name: "Psychology")
let kuuja = Student(id: 6101, name: "Kuuja", faculty: psychologyFaculty)
kuuja.show()
/*
StudentID: 6101, StudentName: Kuuja
nil
nil
*/




//------------------------------------------
// Referring to Nested Types
//------------------------------------------

/*
    let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
    // heartsSymbol is "♡"

*/

struct GradeTranscript{
    enum Grade: String{
        case A
        case B
        case C
        case F

    }

    func getGrade(score: Int) -> String{
        switch score{
            case 91...100:
                return Grade.A.rawValue
            case 71...90:
                return Grade.B.rawValue
            case 51...70:
                return Grade.C.rawValue
            default:
                return Grade.F.rawValue
        }
    }
}

print(GradeTranscript.Grade.A.rawValue) // A

var someGrad = GradeTranscript()
print(someGrad.getGrade(score: 500)) // F





struct Fruit{
    enum RedFruit: String{
        case Apple
        case Watermelon
        case Strawberry

        enum Size: String{
            case small , medium, big
        }
    }
    var fruit: RedFruit?
    var fruitSize: RedFruit.Size?
    var description: String{
        guard let fruit = self.fruit?.rawValue, let fruitSize = self.fruitSize?.rawValue else { return "none" }
        return "Fruit: \(fruit), size = \(fruitSize)"
    }
}

print(Fruit.RedFruit.Watermelon.rawValue) // Watermalon
print(Fruit.RedFruit.Size.big.rawValue) // big

var redFruit = Fruit()
redFruit.fruit = Fruit.RedFruit.Apple
redFruit.fruitSize = Fruit.RedFruit.Size.small
print(redFruit.description) // Fruit: Apple, size = small



struct Monster{
    enum Bird: String{
        case haveWings
        case noWings
        enum Size: Int{
            case small = 1
            case big = 2
            enum MonsterType: String{
                case Boss
                case Normal
                enum Status: String{
                    case alive
                    case dead
                }
            }
        }
    }

    var bird: Bird?
    var size: Bird.Size?
    var type: Bird.Size.MonsterType?
    var status: Bird.Size.MonsterType.Status?
}


print(Monster.Bird.Size.MonsterType.Status.alive.rawValue) // alive

var griffon = Monster()
griffon.bird = Monster.Bird.haveWings
print(griffon.bird?.rawValue) // Optional("haveWings")

griffon.size = Monster.Bird.Size.big
print(griffon.size?.rawValue) // Optional("2")

griffon.type = Monster.Bird.Size.MonsterType.Boss
print(griffon.type?.rawValue) // Optional("Boss")

griffon.status = Monster.Bird.Size.MonsterType.Status.alive
print(griffon.status?.rawValue) // Optional("alive")



var dragon = Monster(bird: .haveWings, size: .big, type: .Boss, status: .alive)

print("Dragon \(dragon.bird!.rawValue)") // Dragon haveWings
print("Dragon sill \(dragon.status!.rawValue)") // Dragon still alive




//------------------------------------------
// 
//------------------------------------------






