//------------------------------------------
// Type Casting
//------------------------------------------

//------------------------------------------
// Defining a Class Hierarchy for Type Casting
//------------------------------------------

/*
    class MediaItem {
        var name: String
        init(name: String) {
            self.name = name
        }
    }
    class Movie: MediaItem {
        var director: String
        init(name: String, director: String) {
            self.director = director
            super.init(name: name)
        }
    }

    class Song: MediaItem {
        var artist: String
        init(name: String, artist: String) {
            self.artist = artist
            super.init(name: name)
        }
    }
    let library = [
        Movie(name: "Casablanca", director: "Michael Curtiz"),
        Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
        Movie(name: "Citizen Kane", director: "Orson Welles"),
        Song(name: "The One And Only", artist: "Chesney Hawkes"),
        Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
    ]
    // the type of "library" is inferred to be [MediaItem]

*/

class Animal{
    var gender: String
    var age: Int
    init(gender: String, age: Int){
        self.gender = gender
        self.age = age
    }
    func move(){
        print("can move")
    }
}

class Dog: Animal{
    var name: String

    init(name: String, gender: String, age: Int){
        self.name = name
        super.init(gender: gender, age: age)
    }
}

class Bird: Animal{

    func fly(){
        print("can fly")
    }
}
class Chicken: Bird{

    override func fly(){
        print("cant fly")
    }
}
class Eagle: Bird{}

class Human: Animal{
    var name: String?

    init(name: String?, gender: String, age: Int){
        self.name = (name) ?? "[Unset]"
        super.init(gender: gender, age: age)
    }
    
    override func move(){
        print("can run")
    }
}

let ZooPark = [
    Dog(name: "Sam", gender: "Male", age: 3),
    Bird(gender: "Male", age: 3),
    Chicken(gender: "Female", age: 5),
    Eagle(gender: "Male", age: 6),
    Dog(name: "Jilly", gender: "Female", age: 3),
    Human(name: nil, gender: "Male", age: 15),
    Animal(gender: "Female", age: 90)
]

print(type(of:ZooPark)) // Array<Animal>

print(type(of:ZooPark[6])) // Animal
print(type(of:ZooPark[5])) // Human

print(ZooPark[6].gender) // Female
print(ZooPark[5].gender) // Male
// print(ZooPark[5].name) // error: value of type 'Animal' has no member 'name'

ZooPark[6].move() // can move
ZooPark[5].move() // can run




//------------------------------------------
// Checking Type
//------------------------------------------

/*
    var movieCount = 0
    var songCount = 0

    for item in library {
        if item is Movie {
            movieCount += 1
        } else if item is Song {
            songCount += 1
        }
    }

    print("Media library contains \(movieCount) movies and \(songCount) songs")
    // Prints "Media library contains 2 movies and 3 songs"

*/

var animalCount = 0, birdCount = 0, chickenCount = 0, eagleCount = 0, dogCount = 0, HumanCount = 0


for item in ZooPark{
    switch item{
        case is Dog:
            dogCount += 1
        case is Human:
            HumanCount += 1
        case is Eagle:
            eagleCount += 1
        case is Chicken:
            chickenCount += 1
        case is Bird:
            birdCount += 1
        case is Animal:
            animalCount += 1
    }
}

print("animalCount", animalCount)
print("birdCount", birdCount)
print("chickenCount", chickenCount)
print("eagleCount", eagleCount)
print("dogCount", dogCount)
print("HumanCount", HumanCount)


//------------------------------------------
// Downcasting
//------------------------------------------

/*
ใช้ as! เมื่อแน่ใจว่า downcast มาจะสำเร็จเท่านั้น
ถ้าไม่มั่นใจใช้ as? จะได้ optional
*/

/*
    for item in library {
        if let movie = item as? Movie {
            print("Movie: \(movie.name), dir. \(movie.director)")
        } else if let song = item as? Song {
            print("Song: \(song.name), by \(song.artist)")
        }
    }

    // Movie: Casablanca, dir. Michael Curtiz
    // Song: Blue Suede Shoes, by Elvis Presley
    // Movie: Citizen Kane, dir. Orson Welles
    // Song: The One And Only, by Chesney Hawkes
    // Song: Never Gonna Give You Up, by Rick Astley

*/


for item in ZooPark{
    if let dog = item as? Dog{
        print("Dog name:\(dog.name)")
    }else if let chicken = item as? Chicken{
        print("can chicken fly?")
        chicken.fly()
    }else if let animal = item as? Animal{
        print("animal gender:\(animal.gender)")
    }
}

/*
Dog name:Sam
animal gender:Male
can chicken fly?
cant fly
animal gender:Male
Dog name:Jilly
animal gender:Male
animal gender:Female
*/




let stringValue:Any = String("drive through")

print(stringValue) // drive through
print(type(of:stringValue)) // String



var starLord: [String:Any] = ["name": "star lord", "hp": 100]

let starLordHP = starLord["hp"] as? String
print(type(of:starLordHP))
print(starLordHP) // nil เพราะ starLord["hp"] เป็น int

let anotherStarLordHP = starLord["hp"] as? Int
print(anotherStarLordHP) // Optional(100)


let starLordName = starLord["name"] as! String
print(type(of:starLordName)) // String
print(starLordName) // star lord

// let failForcedDownCastToString = starLord["hp"] as! String! // *error* Int force downcast เป็น String

let novalueInStarLord = starLord["skill"] as? String
print(type(of:novalueInStarLord)) // Optional<String>
print(novalueInStarLord) // nil

let anotherNovalueInStarLord = starLord["skill"] as? String!
print(type(of:anotherNovalueInStarLord)) // Optional<ImplicitlyUnwrappedOptional<String>>
print(anotherNovalueInStarLord) // Optional(Swift.ImplicitlyUnwrappedOptional<Swift.String>.none)


// let forcedowncastNovalueInStarLord = starLord["skill"] as! String  // *error* ยังไม่มีข้อมูลแต่ force downast

let anottherForcedowncastNovalueInStarLord = starLord["skill"] as! String?
print(type(of:anottherForcedowncastNovalueInStarLord)) // Optional<String>
print(anottherForcedowncastNovalueInStarLord) // nil


var age: Int? = nil
var height: Int? = 180

print(type(of:age))
print(age)
print(type(of:height)) // Optional<Int>
print(height) // Optional(180)
let height2 = height as? String
print(type(of:height2)) // Optional<String>
print(height2) // nil

var name = "Myname"
let name2 = name as! String
print(type(of:name2)) // String
print(name2) // Myname
let name3 = name as! String!
print(type(of:name3)) // Optional<String>
print(name3) // Optional("Myname")
let name4 = name as! String?
print(type(of:name4)) // Optional<String>
print(name4) // Optional("Myname")

let name5 = name as? String
print(type(of:name5)) // Optional<String>
print(name5) // Optional("Myname")
let name6 = name as? String!
print(type(of:name6)) // Optional<ImplicitlyUnwrappedOptional<String>>
print(name6) // Optional(Swift.ImplicitlyUnwrappedOptional<Swift.String>.some("Myname"))
let name7 = name as? String?
print(type(of:name7)) // Optional<Optional<String>>
print(name7) // Optional(Optional("Myname"))
print(name7!) // Optional("Myname")
print(name7!!) // Myname


let value: Any = 100

var guessThisType = value as? Double
print(type(of:guessThisType)) // Optional<Double>
print(guessThisType) // nil
guessThisType = 100
print(type(of:guessThisType)) // Optional<Double>
print(guessThisType) // Optional(100.0)

let intValue = value as? Int
print(type(of:intValue)) // Optional<Int>
print(intValue) // Optional(100)



//------------------------------------------
// Type Casting for Any and AnyObject
//------------------------------------------

/*
    var things: [Any] = []

    things.append(0)
    things.append(0.0)
    things.append(42)
    things.append(3.14159)
    things.append("hello")
    things.append((3.0, 5.0))
    things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
    things.append({ (name: String) -> String in "Hello, \(name)" })

    for thing in things {
        switch thing {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let movie as Movie:
            print("a movie called \(movie.name), dir. \(movie.director)")
        case let stringConverter as (String) -> String:
            print(stringConverter("Michael"))
        default:
            print("something else")
        }
    }

    // zero as an Int
    // zero as a Double
    // an integer value of 42
    // a positive double value of 3.14159
    // a string value of "hello"
    // an (x, y) point at 3.0, 5.0
    // a movie called Ghostbusters, dir. Ivan Reitman
    // Hello, Michael


    let optionalNumber: Int? = 3
    things.append(optionalNumber)        // Warning
    things.append(optionalNumber as Any) // No warning

*/



var arrayZoo: [Any] = []
for item in ZooPark{
    switch item{
        case let animal as Animal:
            print(animal.gender)
            arrayZoo.append(animal)
        default:
            print("dont found class: Animal")
    }
}
/*
Male
Male
Female
Male
Female
Male
Female
*/
print("====")

for item in arrayZoo{
    print(type(of:item))
}
/*
Dog
Bird
Chicken
Eagle
Dog
Human
Animal
*/


let someBoxOfArray: [Any] = [
    1, 1.2, -1.2, "1.3", true, [1, 4], ["1": 5], Dog(name: "Lind", gender: "Box", age: 2), (2.0, 2.1), ("Tuple", "String")
]

for case let string as String in someBoxOfArray{
    print(string)
}
// 1.3

for item in someBoxOfArray{
    switch item{
        case let value as Int:
            print("\(value) is integer")
        case let value as Double where value > 0:
            print("\(value) is double and \(value) > 0")
        case let (x, y) as (Double, Double):
            print("x: \(x), y: \(y)")
        case let text as String:
            print("\(text) is String")
        case let dog as Dog:
            print("this is Dog, name:\(dog.name) age:\(dog.age)")
        case _ as [String: Int]:
            print("dictionaty [String: Int]")
        case let (x, y) as (String, String):
            print("x: \(x), y: \(y)")
        case let bool as Bool:
            print("Boolean: \(bool)")
        default:
            break
    }
}
/*
1 is integer
1.2 is double and 1.2 > 0
1.3 is String
Boolean: true
dictionaty [String: Int]
this is Dog, name:Lind age:2
x: 2.0, y:2.1
x: Tuple, y:String
*/


class Vehicle{
    var wheels: Int

    init(wheels: Int){
        self.wheels = wheels
    }
}

class Car: Vehicle{
    var brand: String

    init(brand: String, wheels: Int){
        self.brand = brand
        super.init(wheels: wheels)
    }
}

class SuperCar: Vehicle{
    var brand: String
    var speed: Int
    init(brand: String, speed: Int, wheels: Int){
        self.brand = brand
        self.speed = speed
        super.init(wheels: wheels)
    }
}

class Boat: Vehicle{
    var brand: String

    init(brand: String){
        self.brand = brand
        super.init(wheels: 0)
    }
}

let tesla:Car = Car(brand: "Tesla", wheels: 4)
print(tesla is Car) // true
print(tesla is Vehicle) // true

let honda = Vehicle(wheels: 8) as? Car
print(type(of:honda)) // Optional<Car>
print(honda) // nil



let showRoom: [AnyObject] = [
    Car(brand: "Teena", wheels: 9),
    Boat(brand: "Roman"),
    SuperCar(brand: "Aston Martin", speed: 180, wheels: 4),
    Car(brand: "Tuna", wheels: 2)
]

for vehicle in showRoom{
    if let car = vehicle as? Car{
        print("This car from brand:\(car.brand) and have \(car.wheels) wheels")
    }else if let boat = vehicle as? Boat{
        print("This is Boat not Car. the brand is \(boat.brand)")
    }else if let supercar = vehicle as? SuperCar{
        print("Faster than Car because this is SuperCar! from brand \(supercar.brand) have maximum speed at \(supercar.speed)")
    }
}
/*
This car from brand:Teena and have 9 wheels
This is Boat not Car. the brand is Roman
Faster than Car because this is SuperCar! from brand Aston Martin have maximum speed at 180
This car from brand:Tuna and have 2 wheels
*/


//------------------------------------------
// 
//------------------------------------------


var anythings: [Any] = []

let optionalNumber: Int? = 3
anythings.append(optionalNumber as Any) // No warning
anythings.append(tesla)
anythings.append("string?" as? String)
anythings.append("123" as? Int)
anythings.append("123.5" as? Double)
anythings.append(426 as Double)
anythings.append(890 as? Double)
anythings.append(Double("99.9"))
anythings.append("String" as String)


for item in anythings{
    print(item, type(of:item))
}
/*
Optional(3) Optional<Int>
test.Car Car
Optional("string?") Optional<String>
nil Optional<Int>
nil Optional<Double>
426.0 Double
nil Optional<Double>
Optional(99.900000000000006) Optional<Double>
String String
*/

print("======")
for item in anythings{
    switch item{
        case let value as Int:
            print("\(value) is integer")
        case let value as Double where value > 0:
            print("\(value) is double and \(value) > 0")
        case let text as String:
            print("\(text) is String")
        case let car as Car:
            print("this is class Car, \(car.brand)")
        case let bool as Bool:
            print("Boolean: \(bool)")
        case nil:
            print("nil")
        case let value:
            print("value:", value)
    }
}

/*
3 is integer
this is class Car, Tesla
string? is String
value: nil
value: nil
426.0 is double and 426.0 > 0
value: nil
99.9 is double and 99.9 > 0
String is String
*/