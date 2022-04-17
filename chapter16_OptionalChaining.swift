//------------------------------------------
// Optional Chaining
//------------------------------------------

/*
ตัวแปรที่ไม่ใช่ optional ก็ทำ optional chaining ได้
แต่เมื่อทำ optional chaining เข้าไปผลลัพธ์จะออกมาเป็น optional เสมอ
ถ้าสิ่งที่ทำเป็น optional อยู่แล้ว ก็จะเป็น optional เหมือนเดิม ไม่มีการซ้อนกันของ optional
*/

//------------------------------------------
// Optional Chaining as an Alternative to Forced Unwrapping
//------------------------------------------


/*
    class Person {
        var residence: Residence?
    }

    class Residence {
        var numberOfRooms = 1
    }

    let john = Person()

    let roomCount = john.residence!.numberOfRooms
    // this triggers a runtime error

    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
    // Prints "Unable to retrieve the number of rooms."

    john.residence = Residence()

    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
    // Prints "John's residence has 1 room(s)."
*/



//------------------------------------------
// Defining Model Classes for Optional Chaining
//------------------------------------------

/*
    class Person {
        var residence: Residence?
    }

    class Residence {
        var rooms: [Room] = []
        var numberOfRooms: Int {
            return rooms.count
        }
        subscript(i: Int) -> Room {
            get {
                return rooms[i]
            }
            set {
                rooms[i] = newValue
            }
        }
        func printNumberOfRooms() {
            print("The number of rooms is \(numberOfRooms)")
        }
        var address: Address?
    }


    class Room {
        let name: String
        init(name: String) { self.name = name }
    }


    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if let buildingNumber = buildingNumber, let street = street {
                return "\(buildingNumber) \(street)"
            } else if buildingName != nil {
                return buildingName
            } else {
                return nil
            }
        }
    }

*/

//------------------------------------------
// Accessing Properties Through Optional Chaining
//------------------------------------------

/*
    let john = Person()
    if let roomCount = john.residence?.numberOfRooms {
        print("John's residence has \(roomCount) room(s).")
    } else {
        print("Unable to retrieve the number of rooms.")
    }
    // Prints "Unable to retrieve the number of rooms."


    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    john.residence?.address = someAddress // ยังเรียกไม่ได้ เพราะ instance residence ยังไม่ถูกสร้าง

// เขียนฟังก์ชันเพื่อให้เห็นว่ามีการเรียกใช้งานจริงๆ หรือไม่
    func createAddress() -> Address {
        print("Function was called.")

        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"

        return someAddress
    }
    john.residence?.address = createAddress() // เรียกใช้งานไม่สำเร็จ
    
*/



enum Element: String{
    case fire, water, earth, wind
    var name: String{
        return self.rawValue
    }

    init(_ value: String){
        switch value{
            case "water":
                self = .water
            case "earth":
                self = .earth
            case "wind":
                self = .wind
            default:
                self = .fire
        }
    }

    func strongAgainst() -> String{
        switch self {
        case .fire:
            return "Wind"
        case .water:
            return "Fire"
        case .earth:
            return "Water"
        case .wind:
            return "Earth"
        }
    }

}

class Skill{
    private var name: [String] = []

    init(){}
    init(name: String){
        addSkill(name)
    }

    var totalSkills: Int{ return name.count }
    var viewSkills: [String]{ return self.name }

    func addSkill(_ name: String){
        self.name.append(name)
    }
    
    subscript(index: Int) -> String{
        get{ return name[index] } 
        set{
            guard index < totalSkills else{ return }
            name[index] = newValue
        }
    }


}

class Guild{
    static var name: String?
    private static var member: [String] = []
    static let maximumMember = 10

    static func register(player: Player){
        if (member.count < maximumMember){
            member.append(player.name)
            player.guild = name
        }else{
            print("Reach to Maximum Member: \(maximumMember)")
        }
    }
    
    static func getMember() -> [String]?{
        return member
    }
    class func guildInfo() -> String?{
        if let name = name{
            return "Guild: \(name), Member:\(Guild.member)"
        }else{
            return nil
        }
    }
}


class Player{
    var name: String = "[Unset]"
    var level: Int = 1
    var skill: Skill?
    var element: Element?
    var guild : String?

    init(){
        // self.element = Element("fire")
    }

}

class Novice{
    var player: Player?
}

var gran = Novice()
if let granElement = gran.player?.element{
    print("Gran have \(granElement) Element")
}else{
    print(type(of:gran.player?.element)) // Optional<Element>
    print("Gran dont have any element yet")
}
// Gran dont have any element yet


// สร้าง Instance element ให้ player
gran.player?.element = Element("Fire")

if let granElement = gran.player?.element{
    print("Gran have \(granElement) Element")
}else{
    print("Gran dont have any element yet")
}
// Gran dont have any element yet
// gran ยังไม่มี instance player เลยยังไม่สามารถสร้าง instance ให้กับ element ได้


let fireElement = Element("Fire")
print(fireElement) // fire
gran.player?.element = fireElement

print(gran.player?.element) // nil

if let granElement = gran.player?.element{
    print("Gran have \(granElement) Element")
}else{
    print(type(of:gran.player?.element)) // Optional<Element>
    print("Gran dont have any element yet")
}



// assign name ให้ Static Guild
Guild.name = "Miracle"
print(Guild.name) // Optional("Miracle")

if let gran = gran.player{
    Guild.register(player: gran)
    print(Guild.guildInfo())
}else{
    print("Cant enter this guild")
    print(Guild.guildInfo())
}
// Cant enter this guild
// Optional("Guild: Miracle, Member:[]")


if let granGuild = gran.player?.guild{
    print("Gran's Guild: \(granGuild)")
}else{
    print(type(of:gran.player?.guild)) // Optional<String>
    print("Gran dont have any guild yet")
}
// Gran dont have any guild yet




// เขียนฟังก์ชันเพื่อให้เห็นว่ามีการเรียกใช้งานจริงๆ หรือไม่
func assignElement() -> Element{
    print("inside assignElement")

    let fireElement = Element("Fire")
    print(fireElement) // fire
    
    return fireElement
}


// assign fire Element to player
gran.player?.element = assignElement()
// ไม่มีอะไรเกิดขึ้น




//------------------------------------------
// Calling Methods Through Optional Chaining
//------------------------------------------

/*
// residence ยังไม่ถูกสร้าง ผลลัพธ์จะได้ optional Void
    if john.residence?.printNumberOfRooms() != nil {
        print("It was possible to print the number of rooms.")
    } else {
        print("It was not possible to print the number of rooms.")
    }
    // Prints "It was not possible to print the number of rooms."


// การ assign value ก็เป็นส่วนหนึ่งของ optional chaining สามารถเอามาเช็ค nil ได้
    if (john.residence?.address = someAddress) != nil {
        print("It was possible to set the address.")
    } else {
        print("It was not possible to set the address.")
    }
    // Prints "It was not possible to set the address."
*/



if let element = gran.player?.element?.strongAgainst(){
    print("My Element is Strong Against \(element)")
}else{
    print("dont have any element")
}
// dont have any element


if (gran.player?.element? = fireElement) != nil{
    print("assign success")
}else{
    print("cannot assign fireElement to player")
}
// cannot assign fireElement to player




//------------------------------------------
// Accessing Subscripts Through Optional Chaining
//------------------------------------------

/*
// residence ยังไม่มี instance
    if let firstRoomName = john.residence?[0].name {
        print("The first room name is \(firstRoomName).")
    } else {
        print("Unable to retrieve the first room name.")
    }
    // Prints "Unable to retrieve the first room name."

// ยังคงเป็น nil แต่การ assign สามารถทำ optional chianing ได้
    john.residence?[0] = Room(name: "Bathroom")


// สร้าง instance ของ Residence ให้ john
    let johnsHouse = Residence()
    johnsHouse.rooms.append(Room(name: "Living Room"))
    johnsHouse.rooms.append(Room(name: "Kitchen"))
    john.residence = johnsHouse // john.residence ชี้มาที่ johnsHouse

    if let firstRoomName = john.residence?[0].name {
        print("The first room name is \(firstRoomName).")
    } else {
        print("Unable to retrieve the first room name.")
    }
    // Prints "The first room name is Living Room."
*/





// player มี properties: var skill: Skill?
if let granSkill = gran.player?.skill?[0]{
    print("gran first skill is \(granSkill)")
}else{
    print("gran dont have any skill")
}
// gran dont have any skill

// assign skill ให้ gran
gran.player?.skill?.addSkill("Fireball")
gran.player?.skill? = Skill(name: "Fireball")

// สร้าง instance ของ skill
let firstSetSkillForGran = Skill()
firstSetSkillForGran.addSkill("Fireball")
firstSetSkillForGran.addSkill("Trick Dead")
print(firstSetSkillForGran.viewSkills)
// ["Fireball", "Trick Dead"]


// สร้าง instance ของ player
let instanceForGran = Player()
instanceForGran.name = "Gran"

// ให้ instanceForGran.skill ชี้มาที่ firstSetSkillForGran
instanceForGran.skill = firstSetSkillForGran

// ให้ gran.player ชี้มาที่ instanceForGran
gran.player = instanceForGran

// gran มีข้อมูล name, level, skill แล้ว ยกเว้น element, guild
print(gran.player?.name)
// Optional("Gran")
print(type(of:(gran.player?.name))) // Optional<String>

print(gran.player?.level) // Optional(1)
print(gran.player?.skill?.viewSkills)
// Optional(["Fireball", "Trick Dead"])




print(gran.player?.skill?[1])
// Optional("Trick Dead")

// assign สกิลเพิ่มให้กับ gran
gran.player?.skill?.addSkill("Heal")

print(gran.player?.skill?.viewSkills)
// Optional(["Fireball", "Trick Dead", "Heal"])

func addSkillToPlayer(_ skills: String) -> String{
    print("addSkillToPlayer was called")
    return skills
}

// แก้ไขค่า ด้วย optional chaninung หลังจากมี instance skill แล้ว
gran.player?.skill?[2] = addSkillToPlayer("Sit")
// addSkillToPlayer was called
gran.player?.skill?[3] = addSkillToPlayer("Strike")
// addSkillToPlayer was called

instanceForGran.skill?.addSkill("ADD SKILL FROM REF INSTANCE")

print(gran.player?.skill?.viewSkills)
// Optional(["Fireball", "Trick Dead", "Sit", "ADD SKILL FROM REF INSTANCE"])

print(instanceForGran.skill?.viewSkills)
// Optional(["Fireball", "Trick Dead", "Sit", "ADD SKILL FROM REF INSTANCE"])




// gran ยังไม่มี element, guild
print(gran.player?.element) // nil
print(gran.player?.guild) // nil



//------------------------------------------
// Accessing Subscripts of Optional Type
//------------------------------------------

/*
    var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
    testScores["Dave"]?[0] = 91
    testScores["Bev"]?[0] += 1
    testScores["Brian"]?[0] = 72
    // the "Dave" array is now [91, 82, 84] and the "Bev" array is now [80, 94, 81]
*/



// return Optional Type
var macbookDetails = ["Macbook" : (name: "Macbook 2099", price: 50_000, ram: "800gb")]
let macbook = macbookDetails["Macbook"]
print(macbook)
// Optional((name: "Macbook 2099", price: 50000, ram: "800gb"))
print(type(of:macbook))
// Optional<(name: String, price: Int, ram: String)>

if let price = macbookDetails["Macbook"]?.price{
    print(type(of:price)) // Int
    print("This year we have macbook and price is \(price)")
}
// This year we have macbook and price is 50000

if let newPriceForMacbook = macbookDetails["Macbook"]?.price = 900{
    print("But today we will sell it only \(macbookDetails["Macbook"]!.price)!")
    print("and this is optional void or ()?: \(newPriceForMacbook)")
}
/*
But today we will sell it only 900!
and this is optional void or ()?: ()
*/


// return Optional Values
// สร้างตัวแปรแบบใช้ Dictionary?
var anotherMacbookDetails: Dictionary?
 = ["Macbook" : (name: "Macbook 2099", price: 50_000, ram: "800gb")]

let newMacbook = anotherMacbookDetails?["Macbook"]
print(newMacbook)
// Optional((name: "Macbook 2099", price: 50000, ram: "800gb"))
print(type(of:newMacbook))
// Optional<(name: String, price: Int, ram: String)>

// มี ? ซ้อนสองอัน
if let price = anotherMacbookDetails?["Macbook"]?.price{
    print(type(of:price)) // Int
    print("This year we have macbook and price is \(price)")
}
// This year we have macbook and price is 50000






//------------------------------------------
// Linking Multiple Levels of Chaining
//------------------------------------------

/*
// มี residence แล้ว แต่ยังไม่มี address ฉะนั้นจะ fail ที่ address
// และเมื่อ fail ที่ใดที่นึงจะ fail ทั้งหมด
// street เป็น String ฉะนั้นจะ return เป็น optional String -> String?
    if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }
    // Prints "Unable to retrieve the address."

// สร้าง instance ของ Address
    let johnsAddress = Address()
    johnsAddress.buildingName = "The Larches"
    johnsAddress.street = "Laurel Street"
    john.residence?.address = johnsAddress


    if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }
    // Prints "John's street name is Laurel Street."

*/


// gran ยังไม่มี element, guild
// และเมื่อ gran ยังไม่มี element ฉะน้ันจะ fail ทั้งหมด
if let granElement = gran.player?.element?.name{
    print("my element is \(granElement)")
}else{
    print("gran still dont have any element")
}
// gran still dont have any element



if let element = gran.player?.element?.strongAgainst(){
    print("My Element is Strong Against \(element)")
}else{
    print("dont have any element")
}
// dont have any element



//------------------------------------------
// Chaining on Methods with Optional Return Values
//------------------------------------------

/*


    if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
        print("John's building identifier is \(buildingIdentifier).")
    }
    // Prints "John's building identifier is The Larches."

// สามารถทำ optional chaining ต่อจากค่าที่ return จาก Methods ได้
// เป็นการทำ optional chaining ของค่าที่ return จาก Methods ไม่ใช่จากตัว Methods
    if let beginsWithThe =
        john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
        if beginsWithThe {
            print("John's building identifier begins with \"The\".")
        } else {
            print("John's building identifier doesn't begin with \"The\".")
        }
    }
    // Prints "John's building identifier begins with "The"."
*/



// สร้าง instance ให้ element, guild ของ gran
let waterElement = Element("water")

// ชี้ไปที่ instance ที่เพิ่งสร้างขึ้น
gran.player?.element = waterElement


// เช็ค อีกครั้งว่า gran มี element หรือยัง
if let granElement = gran.player?.element?.name{
    print("my element is \(granElement)")
}else{
    print("gran still dont have any element")
}
// my element is water

// func strongAgainst() -> String
if let element = gran.player?.element?.strongAgainst(){
    print("My Element is Strong Against \(element)")
}else{
    print("dont have any element")
}
// My Element is Strong Against Fire


if let countWord = gran.player?.element?.strongAgainst().count{
    print("length of this word = \(countWord)")
}else{
    print("cannot read this word")
}
// length of this word = 4

if let findSkillCountLessNine = gran.player?.skill?.viewSkills.filter({ $0.count < 9}){
    print(findSkillCountLessNine)
    print(type(of:findSkillCountLessNine)) // Array<String>
}
// ["Fireball"]

// เพิ่ม gran เข้าไปใน Static Guild
if let addGranToGuild = gran.player{
    Guild.register(player: addGranToGuild)
}

// gran มี guild ชื่อ Miracle แล้ว
print(gran.player?.guild)
// Optional("Miracle")

// เช็คใน static guild ว่า gran เป็นสมาชิกหรือยัง
// เรียกใช้ class func guildInfo() -> String?
print(Guild.guildInfo())
// Optional("Guild: Miracle, Member:[\"Gran\"]")


print(Guild.getMember())
// Optional(["Gran"])



//------------------------------------------
// 
//------------------------------------------


struct Music{
    let title: String?
}

let song: Music? = Music(title: "Waka Waka")
print(song?.title?.count) // Optional(9)

let song2: Music? = Music(title: "Waka Waka")
print(song2?.title!.count) // Optional(9)

let stringTenInOptionalInt: Int? = Int("10")
print(type(of:stringTenInOptionalInt)) // Optional<Int>
let tenMultiplyTen = stringTenInOptionalInt.map{ $0 * $0 }
print(tenMultiplyTen) // Optional(100)


var textA: String? = "textA"
var textB: String = "textB"
var textC: String? = textA
// var textD: String = textA // *error*

textA = "textC"
print(textC) // Optional("textA")




print("=====")




