//------------------------------------------
// Enumerations
//------------------------------------------

//------------------------------------------
// Enumeration Syntax
//------------------------------------------

func typeOf(_ data:Any) -> () {
    print(type(of:data))
}




/*
    enum SomeEnumeration {
        // enumeration definition goes here
    }

*/


//------------------------------------------
// Multiple cases can appear on a single line, separated by commas:
//------------------------------------------


    // enum Planet {
    //     case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    // }


    enum CompassPoint {
        case north, south,east, west
    }


enum DaysOfWeek: CaseIterable {
    case monday, tuesday, wendesday, thursday, friday, saturday, sunday
}



var directionToHead = CompassPoint.west

directionToHead = .east




//------------------------------------------
// Matching Enumeration Values with a Switch Statement
//------------------------------------------


    directionToHead = .south
    switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
    }
    // Prints "Watch out for penguins"
    

    
    let somePlanet = Planet.earth
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
    // Prints "Mostly harmless"



enum MoveDirection{
    case forward
    case backward
    case left
    case right

    mutating func moveLeft(){
        self = .left
    }

    // func moveRight(){ // *error* method 'mutating' to make 'self' mutable
    mutating func moveRight(){
        self = .right
    }

    func show(){
        print(self)
    }
}

// var movement = MoveDirection() // *error* ไม่มี initializer
var movement = MoveDirection.forward
movement.show() // forward
movement.moveLeft()
movement.show() // left

switch movement{
    case .forward:
        print("move forward")
    case .backward:
        print("move backward")
    case .left:
        print("move to left")
    case .right:
        print("move to right")
}

// move to left


enum Season {
   case hot
   case cool
   case wet
}

let currentSeason = Season.hot
print(currentSeason) // hot
typeOf(currentSeason) // Season

let nextSeason: Season = .wet
print(nextSeason) // wet
typeOf(nextSeason) // Season





//------------------------------------------
// Iterating over Enumeration Cases
//------------------------------------------

    enum Beverage: CaseIterable {
        case coffee, tea, juice
    }
    let numberOfChoices = Beverage.allCases.count
    print("\(numberOfChoices) beverages available")
    // Prints "3 beverages available"


    for beverage in Beverage.allCases {
        print(beverage)
    }
    // coffee
    // tea
    // juice



enum Speed: Int, CaseIterable{
    case high = 3
    case medium = 2
    case low = 1
}

func testSpeed(_ speed: Speed) -> String{
    if (speed == .high) || (speed == .medium){
        return "Please Slow Down"
    }else{
        return "Good"
    }
}

for item in Speed.allCases{
    print(testSpeed(item))
}
/*
Please Slow Down
Please Slow Down
Good
*/




let numberOfWeeks = DaysOfWeek.allCases.count
print("One week have \(numberOfWeeks) days")
// One week have 7 days

for day in DaysOfWeek.allCases{
    print(day)
}
/*
monday
tuesday
wendesday
thursday
friday
saturday
sunday
*/



//------------------------------------------
// Associated Values
//------------------------------------------

/*
สามารถรับและเก็บค่าต่างๆ ประเภทใดก็ได้ ไว้ในแต่ละ case
*/
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }


var productBarcode = Barcode.upc(8, 85909, 51226, 3)


productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// เช็คค่าใน productBarcode
    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
    // Prints "QR code: ABCDEFGHIJKLMNOP."


// ใช้ let ข้างนอกทีเดียวได้
    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
    }
    // Prints "QR code: ABCDEFGHIJKLMNOP."



enum LukeSkywalker{
    case profile(name: String, age:Int, height:Int, weight:Int)
    case weapon(String)
    case master(name: String)
}

var luke = LukeSkywalker.profile(name: "Luke Skywalker", age: 1, height: 172, weight: 73)
// var luke = LukeSkywalker.profile(name: "Luke Skywalker", 1, 172, 73) // *error* ต้องใส่ argument
print(luke)
// profile(name: "Luke Skywalker", age: 1, height: 172, weight: 73)
typeOf(luke) // LukeSkywalker

luke = LukeSkywalker.weapon("Saber")
print(luke) // weapon("Saber")

luke = LukeSkywalker.profile(name: "Luke Skywalker", age: 1, height: 172, weight: 73)

switch luke{
    case let .profile(name, age, height, weight):
        print("Jedi: \(name), Age \(age), Height \(height), Weight \(weight)")
    case let .weapon(weapon):
        print("Weapon: \(weapon)")
    case let .master(master):
        print("Master: \(master)")
}

// Jedi: Luke Skywalker, Age 1, Height 172, Weight 73


// รับมาเป็น tuple
switch luke{
    case .profile(let data):
        print("Jedi: \(data.name), Age \(data.age), Height \(data.height), Weight \(data.weight)")
    default:
        print("tuple case. show only profile")
}

// Jedi: Luke Skywalker, Age 1, Height 172, Weight 73

// เปลี่ยนค่าใน case บางตัวเป็น var เพื่อที่จะสามารถเปลี่ยนแปลงค่าที่เคยสร้างไว้
switch luke{
    case .profile(var name, var age, let height, let weight):
        name = "i am THE GOD! CALL ME " + name + "!!!!"
        age = 99999
        // weight = 1 // *error*
        print("Jedi: \(name), Age \(age), Height \(height), Weight \(weight)")
    default:
        print("this is default. have set some case to let and var")
}

// Jedi: i am THE GOD! CALL ME Luke Skywalker!!!!, Age 99999, Height 172, Weight 73


// เปลี่ยนค่าใน case ทุกตัวเป็น var
switch luke{
    case var .profile(name, age, height, weight):
        name = "who am i"
        age = age + height + weight
        print("Jedi: \(name), Age \(age), Height \(height), Weight \(weight)")
    default:
        print("this is default. have set case var")
}

// Jedi: who am i, Age 246, Height 172, Weight 73




enum Weather {
    case sun(feel: String)
    case rain
    case snow
    case wind(speed: Int)
}

func getWeatherStatus(weather: Weather) -> String? {
    switch weather {
    case .sun(let feel) where feel == "hot":
        return "So Hot"
    case .sun(_):
        return "i feel it"
    case .snow:
        return "dislike"
    case .rain:
        return "hate"
    case let .wind(speed) where speed < 5:
        return "so good"
    case .wind(_):
        return "not good"
    }
}

print(getWeatherStatus(weather: Weather.sun(feel: "hot")))
// Optional("So Hot")

var strongWind = Weather.wind(speed: 900)
print(getWeatherStatus(weather: strongWind))
// Optional("not good")


enum Currency: String{
    case baht
    case yen
    case usd

    func description() -> String{
        switch self{
            case .baht:
                return "Thai Baht (฿)"
            case .yen:
                return "Yen (¥)"
            case .usd:
                return "United States Dollar ($)"
        }
    }
}


var thaiBaht = Currency.baht
typeOf(thaiBaht.rawValue) // String
print(thaiBaht.description()) // Thai Baht (฿)







//------------------------------------------
// Raw Values
//------------------------------------------

// เวลาจะกำหนด raw values ทุกๆ case ต้องมี type เดียวกัน และต้องไม่ซ้ำ ไม่สามารถเปลี่ยนแปลงได้
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }


    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }




//------------------------------------------
// Implicitly Assigned Raw Values
//------------------------------------------


let earthsOrder = Planet.earth.rawValue
print(earthsOrder)
// earthsOrder is 3


enum MoveDirectionRawValueString: String{
    case forward
    case backward
    case left
    case right
}

enum MonthsInInt: Int{
   case january = 12 , february = 15, march, april
}

var myMonth = MonthsInInt.april.rawValue
print(myMonth) // 17
typeOf(myMonth) // Int

let valueInMoveDirectionRawValueString = MoveDirectionRawValueString.forward.rawValue
print(valueInMoveDirectionRawValueString) // forward



enum Gender: String{
    case male = "Male"
    case female = "female"

    func getRawValue() -> String{
        return self.rawValue
    }
}

var guessThisGender = Gender.male
print(guessThisGender.getRawValue()) // Male


enum Mood: String{
    case happy = "Happy"
    case unhappy = "Unhappy"
    case joy = "Joy"
}

let mood = [Mood.happy, .unhappy, .joy]

let guessMyMood = mood.map{ mood in mood.rawValue}
print(guessMyMood) // ["Happy", "Unhappy", "Joy"]




enum Activity: String{
    case walking = "Walking"
    case running = "Running"
    case talking = "Talking"
}

var myActivityArray: [Activity] = [.walking]
print(myActivityArray[0]) // walking
print(myActivityArray[0].rawValue) // Walking
typeOf(myActivityArray) // Array<Activity>

myActivityArray.append(Activity.running)

for item in myActivityArray{
    print(item)
}
/*
walking
running
*/




enum Strom: Int{
    case strong = 3
    case moderate = 2
    case minor = 1
}

var myStorm: [Strom: String] = [
    .strong: "Run away!", .moderate: "Be careful", .minor: "maybe.. just wind?"
    ]

print(myStorm[.strong]) // Optional("Run away!")
for item in myStorm.keys{
    print(item, item.rawValue)
}
/*
minor 1
strong 3
moderate 2
*/





//------------------------------------------
// Initializing from a Raw Value
//------------------------------------------


// กำหนดค่าเริ่มต้นโดยการใช้ rawValue และ enum ต้องมี rawValue เท่านั้นถึงจะเรียกใช้ initializer ได้
    let possiblePlanet = Planet(rawValue: 7)
    // possiblePlanet is of type Planet? and equals Planet.uranus

print(possiblePlanet)
// Optional(chapter8_Enumerations.Planet.uranus)
typeOf(possiblePlanet) // Optional<Planet>


// monthInInt = Months(rawValue: 12) // *error*
// error: cannot assign value of type 'Months?' to type 'Int' monthInInt = Months(rawValue: 12)

var monthInitializer = MonthsInInt(rawValue: 13) 
print(monthInitializer) // nil


// ต้องมีการทำ optional binding เพราะค่าที่ใส่อาจจะหาเจอหรือไม่เจอก็ได้ ซึ่งจะได้ค่า nil กลับมา
// หากตรงก็จะได้เป็น Optional ***

    let positionToFind = 11
    if let somePlanet = Planet(rawValue: positionToFind) {
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }
    // Prints "There isn't a planet at position 11"


if let someMove = MoveDirectionRawValueString(rawValue: "left"){
    switch someMove{
        case .forward:
            print("move forward")
        case .backward:
            print("move backard")
        case (.left), (.right):
            print("maybe just move to right.... or maybe left")
    }
}else{
    print("cant find this case")
}

// maybe just move to right.... or maybe left


enum ColorRGB: Character{
    case red = "\u{1F534}"
    case green = "\u{1F7E2}"
    case blue = "\u{1F535}"
}


var myRed = ColorRGB.red.rawValue
print(myRed) // 🔴

enum CircleRGB{
    enum ColorRGB: Character{
        case red = "\u{1F534}"
        case green = "\u{1F7E2}"
        case blue = "\u{1F535}"
    }
    case value(ColorRGB)
}


var myCircleRGB: CircleRGB.ColorRGB = .red
print(myCircleRGB) // red
print(myCircleRGB.rawValue) // 🔴
typeOf(myCircleRGB) // ColorRGB

let mySecondCircleRGB = CircleRGB.value(.blue)
print(mySecondCircleRGB) // value(chapter8_Enumerations.CircleRGB.ColorRGB.blue)
typeOf(mySecondCircleRGB) // CircleRGB




enum FbProfile: String{
    case cover = "cover"
    case profile = "profile"
    case photos = "photos"
}

var viewFBCoverValue = FbProfile.cover
print(viewFBCoverValue) // cover
typeOf(viewFBCoverValue) // FbProfile
var viewFBCoverRawValue = FbProfile.cover.rawValue
print(viewFBCoverRawValue) // cover
typeOf(viewFBCoverRawValue) // String

func viewFB(_ viewIn: String) -> String {
    guard let section = FbProfile(rawValue: viewIn) else{ return "None"}
    
    switch section {
    case .cover:
        return "my cover"
    case .profile:
        return "my profile"
    case .photos:
        return "my photos"
    }
}

var setFBValue = viewFB("photos")
print(setFBValue) // my photos
typeOf(setFBValue) // String



//------------------------------------------
// Recursive Enumerations
//------------------------------------------

/*
เขียน indirect เพื่อใช้ในการ recursive ได้ 2 กรณี

    enum ArithmeticExpression {
        case number(Int)
        indirect case addition(ArithmeticExpression, ArithmeticExpression)
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    }

    indirect enum ArithmeticExpression {
        case number(Int)
        case addition(ArithmeticExpression, ArithmeticExpression)
        case multiplication(ArithmeticExpression, ArithmeticExpression)
    }

*/


    // indirect enum ArithmeticExpression {
    //     case number(Int)
    //     case addition(ArithmeticExpression, ArithmeticExpression)
    //     case multiplication(ArithmeticExpression, ArithmeticExpression)
    // }



    // let five = ArithmeticExpression.number(5)
    // let four = ArithmeticExpression.number(4)
    // let sum = ArithmeticExpression.addition(five, four)
    // let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


    // func evaluate(_ expression: ArithmeticExpression) -> Int {
    //     switch expression {
    //     case let .number(value):
    //         return value
    //     case let .addition(left, right):
    //         return evaluate(left) + evaluate(right)
    //     case let .multiplication(left, right):
    //         return evaluate(left) * evaluate(right)
    //     }
    // }

    // print(evaluate(product))
    // // Prints "18"





 indirect enum Calculator{
    case number(Int)
    case addition(Calculator, Calculator)
    case subtract(Calculator, Calculator)
    case multiply(Calculator, Calculator)
    case divide(Calculator, Calculator)
 }

func calculate(_  expression: Calculator) -> Int{
    switch expression{
        case let .number(value):
            return value
        case let .addition(left, right):
            return calculate(left) + calculate(right)
        case let .subtract(left, right):
            return calculate(left) -  calculate(right)
        case let .multiply(left, right):
            return calculate(left) * calculate(right)
        case let .divide(left, right):
            return calculate(left) / calculate(right)
    }
}


// 3^5 = (((3*3)*3)*3)*3

let three = Calculator.number(3)
let threePowerfiveFirst = Calculator.multiply(three, three) // 3*3
let threePowerfiveSecond = Calculator.multiply(threePowerfiveFirst, threePowerfiveFirst) // (3*3) * (3*3)
let threePowerfiveThird = Calculator.multiply(threePowerfiveSecond, three) // ((3*3) * (3*3)) * 3

print(calculate(threePowerfiveThird))


func recursiveFunction(number x: Int, power n: Int) -> Int{
    if(n == 0){
        return 1
    }else{
        return x * (recursiveFunction(number: x, power:(n - 1)))
    }
}

print(recursiveFunction(number: 3, power: 5)) // 243

// ((3*5) / 2 ) + ((9-2) * 4)

let two = Calculator.number(2)
let four = Calculator.number(4)
let five = Calculator.number(5)
let nine = Calculator.number(9)

let threeMultiplyFive = Calculator.multiply(three, five)
let divideByTwo = Calculator.divide(threeMultiplyFive, two)

let nineSubTwo = Calculator.subtract(nine, two)
let multiplyByFour = Calculator.multiply(nineSubTwo, four)

let plusResult = Calculator.addition(divideByTwo, multiplyByFour)

print(calculate(plusResult)) // 35

print("========= End =========")