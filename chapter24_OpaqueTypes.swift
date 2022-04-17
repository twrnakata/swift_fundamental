//------------------------------------------
// Opaque Types
//------------------------------------------

//------------------------------------------
// The Problem That Opaque Types Solve
//------------------------------------------



/*
สร้าง protocol, structor type ปกติขึ้นมาก่อน
    protocol Shape {
        func draw() -> String
    }

    struct Triangle: Shape {
        var size: Int
        func draw() -> String {
            var result: [String] = []
            for length in 1...size {
                result.append(String(repeating: "*", count: length))
            }
            return result.joined(separator: "\n")
        }
    }
    let smallTriangle = Triangle(size: 3)
    print(smallTriangle.draw())
    // *
    // **
    // ***

    struct FlippedShape<T: Shape>: Shape {
        var shape: T
        func draw() -> String {
            let lines = shape.draw().split(separator: "\n")
            return lines.reversed().joined(separator: "\n")
        }
    }
    let flippedTriangle = FlippedShape(shape: smallTriangle)
    print(flippedTriangle.draw())
    // ***
    // **
    // *


จะเอา Shape มา join กัน โดยจะเป็น Type อะไรก็ได้
โดยสร้าง struct ชื่อ JoinedShape
    struct JoinedShape<T: Shape, U: Shape>: Shape {
        var top: T
        var bottom: U
        func draw() -> String {
            return top.draw() + "\n" + bottom.draw()
        }
    }
    // ถ้าเขียนในลักษณะนี้ user จะต้องรู้ว่า JoinedShape คืออะไร แล้วมีไว้ทำไม ซึ่งบางที USER ไม่จำเป็นต้องรู้ แค่อยากจะได้ Shape ออกมา
    let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
    print(joinedTriangles.draw())
    // *
    // **
    // ***
    // ***
    // **
    // *

*/

//------------------------------------------
// Returning an Opaque Type
//------------------------------------------

/*
จากเดิมที่ใช้ generic รับ input คือ T สิ่งที่ return คือ T 
func max<T>(_ x: T, _ y: T) -> T where T: Comparable { ... }
แต่ opaque type ฟังก์ชั่นจะตัดสินใจว่าจะ return type อะไรออกมา

สร้าง struct เพิ่มมาอีกตัวที่ conform to Shape protocol
    struct Square: Shape {
        var size: Int
        func draw() -> String {
            let line = String(repeating: "*", count: size)
            let result = Array<String>(repeating: line, count: size)
            return result.joined(separator: "\n")
        }
    }

แทนที่จะ return เป็น Shape แต่่ return เป็น Opaque(some)
    func makeTrapezoid() -> some Shape {
        let top = Triangle(size: 2) // struct Triangle: Shape {
        let middle = Square(size: 2) // struct Square: Shape {
        let bottom = FlippedShape(shape: top) // struct FlippedShape<T: Shape>: Shape {
        let trapezoid = JoinedShape(
            top: top,
            bottom: JoinedShape(top: middle, bottom: bottom)
        )
        return trapezoid // ผลลัพธ์ที่ได้เป็น Shape
    }
    let trapezoid = makeTrapezoid()
    print(trapezoid.draw())
    // *
    // **
    // **
    // **
    // **
    // *


// เขียนในลักษณะของ Opaque type
// สร้าง func flip ที่รับอะไรก็ได้เข้ามา โดย return เป็น Opaque type
    func flip<T: Shape>(_ shape: T) -> some Shape {
        // return เป็น instance ของ FlippedShape 
        return FlippedShape(shape: shape)  // struct FlippedShape<T: Shape>: Shape {
    }

// รับ Type ใดๆ และ return เป็น Opaque
    func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
        // return เป็น instance ของ JoinedShape
        JoinedShape(top: top, bottom: bottom) // struct JoinedShape<T: Shape, U: Shape>: Shape {
    }

// เวลาใช้งานก็เรียก function ไม่ต้องสร้าง instance แบบตอนสร้าง JoinedShape
// โดยผลลัพธ์จะออกมาเป็น Shape โดยที่ User ไม่ต้องรู้ว่าสิ่งที่ return มาคือ JoinedShape หรือ FlippedShape
// รู้แค่ว่าเอามา join กันแล้ว เอามา flip ก็จะได้สามเหลี่ยมต่อกัน
    let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
    print(opaqueJoinedTriangles.draw())
    // *
    // **
    // ***
    // ***
    // **
    // *


ถ้าเกิดทำใหม่ ไม่ใส่ some จะเกิด error เพราะ protocol type Shape ไม่สามารถ conform to Shape
    func flip<T: Shape>(_ shape: T) -> Shape {
        // return เป็น instance ของ FlippedShape 
        return FlippedShape(shape: shape)  // struct FlippedShape<T: Shape>: Shape {
    }
ติดปัญหาตรง join เพราะ join ต้องการ parameter 2 ตัว ที่ conform to Shape protocol
    func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
        // return เป็น instance ของ JoinedShape
        JoinedShape(top: top, bottom: bottom) // struct JoinedShape<T: Shape, U: Shape>: Shape {
    }

join(smallTriangle, flip(smallTriangle)) // flip ไม่ conform to Shape
เพราะถ้า function return เป็น protocol อยู่แล้ว มันจะไม่ conform to Protocol อีกครั้ง(nested)
ฉะนั้นถ้าจะแก้ปัญหาต้องใช้ Opaque



แต่ถึงกระนั้น เวลาที่ return เป็น Opaque type ก็มีเงื่อนไขอยู่ ไม่ใช่จะ return ได้ทันที
เงื่อนไขที่ว่าคือ ทุกจุดที่ต้อง return ต้อง return เป็น type เดียวกันเสมอ
จากตัวอย่างข้างล่าง ต้องการทำงานให้เร็วขึ้น ถ้าเกิดเป็น Square ก็ไม่ต้อง Flip ให้ return ทันที ถ้าไม่ใช่ถึงจะ Flip
ในกรณีนี้จะเป็นคนละ type กัน จุดแรก return shape อีกจุด return FlippedShape
แต่ถ้าเป็น **protocol ปกติ ที่ไม่ใช่ Opaque(some) จะสามารถ return ได้ปกติ
    func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
        if shape is Square {
            return shape // Error: return types don't match
        }
        return FlippedShape(shape: shape) // Error: return types don't match
    }

วิธีแก้ปัญหา ถ้าอยากทำในลักษณะนี้คือ แทนที่จะออกแบบแล้วทำเป็น function ให้ไปทำใน FlippedShape แทน

FlippedShape ก่อนที่จะทำการ Flip ก็ให้เช็คก่อนว่าเป็น Square หรือไม่ ถ้าเป็น Square ก็เรียก draw เพราะไม่ต้อง Flip
ถ้าไม่ใช่ก็ต้อง split ก่อน เก็บเป็น Array แล้วค่อย reversed และ join เป็น String อีกทีนึง
    struct FlippedShape<T: Shape>: Shape {
        var shape: T
        func draw() -> String {
            if shape is Square {
                return shape.draw()
            }
            let lines = shape.draw().split(separator: "\n")
            return lines.reversed().joined(separator: "\n")
        }
    }


รับ Shape ที่เป็น type อะไรก็ได้เข้ามา และ count เป็น int โดย return เป็น Opaque type อะไรก็ได้ที่เป็น Collection
**Collection เป็น Array
    func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
        // instance ของ Array
        return Array<T>(repeating: shape, count: count)
    }
กรณีนี้จะ return จุดเดียวที่เป็น Array ของ T จะไม่มีปัญหา

*/



//------------------------------------------
// Differences Between Opaque Types and Protocol Types
//------------------------------------------

/*

ความแตกต่างระหว่าง Opaque types กับ Protocol types
Opaque types จะ refer แค่ 1 types(ทุกจุดจะต้อง return เป็น type เดียวกัน)
Protocol types จะ return type อะไรก็ได้ที่ conform to protocol

ตัวอย่างของ Protocol types
    // จะมีปัญหาก็ต่อเมื่อเรียก function ตัวนี้ใน parameter อื่นที่มี type เป็น protocol เหมือนกันจะมีปัญหา
    func protoFlip<T: Shape>(_ shape: T) -> Shape {
        return FlippedShape(shape: shape)
    }
หรือ
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

ก็ไม่มีปัญหา


// ฟังก์ชั่นด้านล่างจะมีปัญหาเมื่อมีการเรียกฟังก์ชั่น protoFlip เป็น parameter ของ function ตัวอื่นที่เป็น protocol
    func protoFlip<T: Shape>(_ shape: T) -> Shape {
        if shape is Square {
            return shape
        }

        return FlippedShape(shape: shape)
    

    let protoFlippedTriangle = protoFlip(smallTriangle)
    let sameThing = protoFlip(smallTriangle)
    protoFlippedTriangle == sameThing  // Error

จะเปรียบเทียบ instance กับ instance ได้ก็ต่อเมื่อ instance ของ type ดังกล่าว มีการ implement operator == เอาไว้
แต่ใน Shape ไม่ได้มีการ implement operator == เอาไว้
แต่ต่อให้มีก็จะยังมีปัญหา เพราะเวลาเปรียบเทียบจะต้องรู้ว่า type ที่อยู่ทางซ้ายกับทางขวาคือ type อะไรกันแน่
แต่ protocol ไม่รู้ว่าเป็น type อะไร



กรณีที่มี protocol ที่เป็น Generic(associatedtype) ก็จะมีปัญหา
    protocol Container {
        associatedtype Item
        var count: Int { get }
        subscript(i: Int) -> Item { get }
    }
    extension Array: Container { }

เราจะไม่รู้ว่า T เป็น type อะไร
    // Error: Protocol with associated types can't be used as a return type.
    func makeProtocolContainer<T>(item: T) -> Container {
        return [item]
    }

    // Error: Not enough information to infer C.
    func makeProtocolContainer<T, C: Container>(item: T) -> C {
        return [item]
    }

    func makeOpaqueContainer<T>(item: T) -> some Container {
        return [item]
    }
    let opaqueContainer = makeOpaqueContainer(item: 12)
    let twelve = opaqueContainer[0]
    print(type(of: twelve))
    // Prints "Int"


*/


//------------------------------------------
// 
//------------------------------------------



protocol ChickenNotHaveAssociatedTypeProtocol{
    func egg() -> Int
}

struct ChickenFarmNotHaveAssociatedType: ChickenNotHaveAssociatedTypeProtocol{
    var numberOfEgg = 1
    func egg() -> Int{
        return numberOfEgg
    }
}

func getChicken() -> ChickenNotHaveAssociatedTypeProtocol{
    return ChickenFarmNotHaveAssociatedType()
}


if let someChicken = getChicken() as? ChickenNotHaveAssociatedTypeProtocol{
    print(someChicken.egg()) // 1
}


// สร้าง protocol ขึ้นมาอีกตัวมี type เป็น Egg
protocol ChickenHaveAssociatedTypeProtocol{
    associatedtype Egg
    func egg() -> Egg
}


struct Farm: ChickenHaveAssociatedTypeProtocol{
    var numberOfEgg = 1
    func egg() -> Farm{
        return self
    }   
}


struct AnotherFarm: ChickenHaveAssociatedTypeProtocol{
    typealias Egg = Int
    var numberOfEgg = 1
    func egg() -> Egg{
        return numberOfEgg
    }
}

var newFarm = Farm().egg().egg().egg()
print(type(of:newFarm)) // Farm
print(newFarm.numberOfEgg) // 1

// สร้าง Function ขึ้นมา return เป็น Chicken ที่มี AssociatedType
// จะ error เพราะเมื่อใช้ func egg -> Egg เราไม่รู้ datatype ของ Egg จริงๆ เป็นมี type เป็นอะไร
// ฉะนั้นจะ return type จากตัวที่ conform to chicken ตัวนี้

// error: protocol 'ChickenHaveAssociatedTypeProtocol' can only be used as a generic constraint because it has Self or associated type requirements
// func getMoreChicken() -> ChickenHaveAssociatedTypeProtocol{
//     // return Farm()
//     return Farm().egg()
// }


// แก้ปัญหานี้ด้วยการใช้ Opaque Type
func getMoreChicken() -> some ChickenHaveAssociatedTypeProtocol{
    // return Farm()
    return Farm().egg()
}

func getMoreChickenFromAnotherFarm() -> some ChickenHaveAssociatedTypeProtocol{
    return AnotherFarm(numberOfEgg: 90)
}


let someChickenFromFarm = getMoreChicken()
print(someChickenFromFarm.egg()) // Farm(numberOfEgg: 1)

let someChickenFromAnotherFarm = getMoreChickenFromAnotherFarm()
print(someChickenFromAnotherFarm.egg()) // 90




protocol Shape{
    func description() -> String
}

struct Triangle: Shape{
    func description() -> String{
        return "Im Triangle"
    }
}

struct Square: Shape{
    func description() -> String{
        return "Im Square"
    }
}

// return เป็น Shape
func makeShape(shape: Shape) -> Shape{
    return shape
}

let someTriangle = makeShape(shape: Triangle())
print(someTriangle.description())
let someShape = makeShape(shape: Square())
print(someShape.description())

// return เป็น Type อะไรก็ได้ โดยที่ T ต้อง conform to Shape
func makeShapeT<T>(shape: T) -> T where T:Shape{
    return shape
}
let anotherSomeTriangle = makeShapeT(shape: Triangle())
print(anotherSomeTriangle.description()) // Im Triangle

// error: binary operator '==' cannot be applied to two 'Shape' operands
// print(someTriangle == someShape)


print("====")
func showDescriptionOfShape<T :Shape>(_ shape: T){
    print(shape.description())
}

//  error: protocol 'Shape' as a type cannot conform to the protocol itself
// Triangle ที่ได้จาก makeShape ไม่ conform to Shape

// makeShape(shape: Shape) -> Shape**
// showDescriptionOfShape(makeShape(shape: Triangle()))
// error
// showDescriptionOfShape(someTriangle)


//   makeShapeT<T>(shape: T) -> T where T:Shape**
showDescriptionOfShape(makeShapeT( shape: Triangle())) // Im Triangle
showDescriptionOfShape(anotherSomeTriangle) // Im Triangle


print("====")

// Shape without associatedtype
func getSquareFirst<T: Shape>(_ shape:T) -> Shape{
    if shape is Square{
        return shape
    }
    return Triangle()
}


// ไม่มีปัญหา
// let arrayOfShape = [makeShape(shape: Square())]

// ตัว makeShape(shape: Shape) -> Shape และ getSquareFirst<T: Shape>(_ shape:T) -> Shape
// : error: protocol 'Shape' as a type cannot conform to the protocol itself
// let arrayOfShape = [getSquareFirst(makeShape(shape: Square()))]


// ตัว getSquareFirst<T: Shape>(_ shape:T) -> Shape และ getSquareFirst<T: Shape>(_ shape:T) -> Shape
let arrayOfShapeT = [
    getSquareFirst(makeShapeT( shape: Triangle())),
    getSquareFirst(makeShapeT( shape: Square())),
    getSquareFirst(anotherSomeTriangle)
]

print("---")
for shape in arrayOfShapeT{
    print(shape.description())
}
print("---")
/*
Im Triangle
Im Square
Im Triangle
*/


/*
// error: cannot convert return expression of type 'Square' to return type 'T'
func getTriangleFirst<T>(_ shape: T) -> T where T: Shape{
    if shape is Triangle{
        return shape
    }
    return Square()
}
*/


struct GetSquareStructFirst<T: Shape>: Shape{
    var shape: T
    func description() -> String{
        return "Just Return Square First"
    }
    func getSquare() -> Shape{
        if shape is Square{
            return shape
        }
        return Triangle()
        // ถ้าจะ return เป็น Square ทั้งคู่ก็ทำได้
        // return Square() // ใช้ได้
    }
}

let firstGetSquareStruct = GetSquareStructFirst(shape: Triangle()).getSquare()
let secondGetSquareStruct = GetSquareStructFirst(shape: Square()).getSquare()
let justCreateInstance = GetSquareStructFirst(shape: Square())
print(firstGetSquareStruct.description()) // Im Triangle
print(secondGetSquareStruct.description()) // Im Square
print(justCreateInstance.description()) // Just Return Square First
print(justCreateInstance.shape.description()) // Im Square



//------------------------------------------
// Test Protocol with associatedtype
//------------------------------------------


protocol ShapeHaveColor: Equatable{
    associatedtype Color
    var color: Color { get }
    func description() -> String
}


struct TriangleHaveColor: ShapeHaveColor{
    var color: Int = 1
    func description() -> String{
        return "Im Triangle"
    }
}

struct SquareHaveColor: ShapeHaveColor{
    var color: String = "Red"
    func description() -> String{
        return "Im Square"
    }
}


// ไม่รู้ว่า Type Color คืออะไร
//  error: protocol 'ShapeHaveColor' can only be used as a generic constraint because it has Self or associated type requirements
// func makeAnotherShape(shape: ShapeHaveColor) -> ShapeHaveColor{
//     return shape
// }

// error เพราะ shape ที่ return ไม่ได้ return เป็น type เดียวกันเสมอ จะมีบางตัวที่ Color ของ shape มี type เป็นชนิดอื่น
// error: protocol 'ShapeHaveColor' as a type cannot conform to the protocol itself
//  note: required by opaque return type of global function 'makeAnotherShape(shape:)'
// func makeAnotherShape(shape: ShapeHaveColor) -> some ShapeHaveColor{
//     return shape
// }


func makeAnotherShape<T: ShapeHaveColor>(shape: T) -> some ShapeHaveColor{
    return shape
}

let firstShapeHaveColor = makeAnotherShape(shape: TriangleHaveColor(color: 25))
let secondShapeHaveColor = makeAnotherShape(shape: SquareHaveColor(color: "Blue"))
print(firstShapeHaveColor.color) // 25
print(secondShapeHaveColor.color) // Blue




func makeShapeTriangle(color: Int) -> some ShapeHaveColor{
    return TriangleHaveColor(color: color)
}
func makeShapeSquare(color: String) -> some ShapeHaveColor{
    return SquareHaveColor(color: color)
}


let newTriangleFromFunction = makeShapeTriangle(color: 9)
let newSquareFromFunction = makeShapeSquare(color: "9")

print(newTriangleFromFunction.color) // 9
print(newSquareFromFunction.color) // 9

// สร้าง instance ของ Square ที่มี Color มาเพิ่ม
let anotherSquareFromFunction = makeShapeSquare(color: "9")
print(newSquareFromFunction == anotherSquareFromFunction) // true




print("====")
func showDescriptionOfShapeHaveColor<T :ShapeHaveColor>(_ shape: T){
    print(shape.color)
}

// makeShapeTriangle(color: Int) -> some ShapeHaveColor
showDescriptionOfShapeHaveColor(newTriangleFromFunction) // 9
showDescriptionOfShapeHaveColor(makeShapeTriangle(color: 10)) // 10

showDescriptionOfShapeHaveColor(newSquareFromFunction) // 9

print("====")


/*
Shape with associatedtype
Shape ที่ return ไม่ conform to ShapeHaveColor protocol

// error: protocol 'ShapeHaveColor' can only be used as a generic constraint because it has Self or associated type requirements
func getSquareFirst<T: ShapeHaveColor>(_ shape: T) -> ShapeHaveColor{ // **
    if shape is SquareHaveColor{
        return shape
    }else{
        return TriangleHaveColor()
    }
}

return คนละ type ในฟังก์ชั่นที่ return เป็น Opaque
error: function declares an opaque return type, but the return statements in its body do not have matching underlying types
func getOpaqueSquareFirst<T: ShapeHaveColor>(_ shape: T) -> some ShapeHaveColor{ // **
    if shape is SquareHaveColor{
        return shape
    }else{
        return TriangleHaveColor()
    }
}


// error: cannot convert return expression of type 'TriangleHaveColor' to return type 'T'
func getOpaqueSquareFirst<T>(_ shape: T) -> T where T: ShapeHaveColor{
    if shape is SquareHaveColor{
        return shape
    }
    return TriangleHaveColor()
}

// 'some' types are only implemented for the declared type of properties and subscripts and the return type of functions
func getOpaqueSquareFirst<T>(_ shape: T) -> T where T: some ShapeHaveColor{
    if shape is SquareHaveColor{
        return shape
    }
    return TriangleHaveColor()
}

// error: cannot convert return expression of type 'TriangleHaveColor' to return type 'T'
func getOpaqueSquareFirst<T: ShapeHaveColor>(_ shape: T) -> T{
    if shape is SquareHaveColor{
        return shape
    }
    return TriangleHaveColor()
}
*/

// struct A<T: ShapeHaveColor>: ShapeHaveColor{
//     var shape: T
//     var color: Int
//     func description() -> String{
//         return "Just Get Triangle First"
//     }

//     func getTriangle() -> ShapeHaveColor{
//         if shape is TriangleHaveColor{
//             return TriangleHaveColor()
//         }
//         return SquareHaveColor()
//     }
// }


struct GetTriangleHaveColorFirst<T: ShapeHaveColor>: ShapeHaveColor{
    var shape: T
    var color: Int
    func description() -> String{
        return "Just Get Triangle First"
    }

    // ใช้ได้สองแบบ แต่จะ return ได้แต่ type ของตัว T เท่านั้น
    // func getTriangle() -> T{
    func getTriangle() -> some ShapeHaveColor{
        if shape is TriangleHaveColor{
            return shape
        }
        return shape
    }
}


let instanceOfGetTriangleHaveColor = GetTriangleHaveColorFirst(shape: SquareHaveColor(), color: 2).getTriangle()
print(instanceOfGetTriangleHaveColor.description()) // Im Square
let anotherInstanceOfGetTriangleHaveColor = GetTriangleHaveColorFirst(shape: TriangleHaveColor(), color: 3).getTriangle()
print(anotherInstanceOfGetTriangleHaveColor.description()) // Im Triangle



//------------------------------------------
// 
//------------------------------------------



protocol AnimalProtocol{
    var name: String { set get }
    func sameAnimal<T: AnimalProtocol>(with animal: T) -> Bool
    func getAnimal() -> AnimalProtocol
}

struct Dog: AnimalProtocol{
    var name = "Dog"

    func sameAnimal<T: AnimalProtocol>(with animal: T) -> Bool{
        if animal is Dog{
            return true
        }
        return false
    }
    func getAnimal() -> AnimalProtocol{
        return self
    }
}

struct Cat: AnimalProtocol{
    var name = "Cat"

    func sameAnimal<T: AnimalProtocol>(with animal: T) -> Bool{
        if animal is Cat{
            return true
        }
        return false
    }
    func getAnimal() -> AnimalProtocol{
        return self
    }
}

let someDog = Dog()
let someCat = Cat()
print(someDog.sameAnimal(with: someDog)) // true
print(someDog.sameAnimal(with: someCat)) // false

let newDog = someDog.getAnimal()

//  error: protocol 'AnimalProtocol' as a type cannot conform to the protocol itself
// print(someDog.sameAnimal(with: newDog))

func getAnimal<T: AnimalProtocol>(with animal: T) -> T{
    return animal
}

let anotherDog = getAnimal(with: someDog)
print(someDog.sameAnimal(with: anotherDog)) // true

func getSomeAnimal<T: AnimalProtocol>(with animal: T) -> some AnimalProtocol{
    return animal
}
let newCat = getSomeAnimal(with: someCat)
print(someCat.sameAnimal(with: newCat)) // true







protocol GameProtocol{
    associatedtype Game where Game: GameProtocol
    init()
    func play()
    func build() -> Game
}

struct Football: GameProtocol{
    var name = "Football"
    let maxinumPlayer = 11

    func play(){
        print("go the the ball with maxinumPlayer per Team = \(maxinumPlayer)")
    }
    func build() -> Football{
        return self
    }
}

struct BasketBall: GameProtocol{
    var name = "BasketBall"

    func play(){
        print("Grab the ball")
    }
    func build() -> BasketBall{
        return self
    }
}

// มี associatedtype
// error: an 'opaque' type must specify only 'Any', 'AnyObject', protocols, and/or a base class
// func buildGame<T: GameProtocol>() -> some T{


func buildGame<T: GameProtocol>() -> T{
    T()
}
// แต่จะมีปัญหาตอน nested ถ้าไม่อยากให้มีปัญหา ให้ใช้
// func buildGame<T: GameProtocol>(from: T) -> some GameProtocol{

let football: Football = buildGame()
let basketball: BasketBall = buildGame()
football.play() // go the the ball with maxinumPlayer per Team = 11
basketball.play() // Grab the ball




protocol VehicalProtocol{
    func move()
    init()
}

struct Car: VehicalProtocol{
    var name = "Car"

    func move(){
        print("on the road")
    }
}

struct AirPlane: VehicalProtocol{
    var name = "Air Plane"

    func move(){
        print("can fly")
    }
}

func buildCar() -> some VehicalProtocol{
    Car()
}
func buildAirPlane() -> some VehicalProtocol{
    AirPlane()
}

let car = buildCar()
let airplane = buildAirPlane()

car.move() // on the road
airplane.move() // can fly
