/*1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.*/


enum actEngine: String {
    case startEngine = "Двигатель работает"
    case stopEngine = "Двигатель не работает"
}

enum actWindow: String {
    case openWindow = "Окна открыты"
    case closeWindow = "Окна закрыты"
}

protocol Car {
    var brand: String { get }
    var year: Int { get }
    var winStatus: actWindow { get }
    var engStatus: actEngine { get }
    
}

extension Car {
    mutating func WinStatusChange () {
        if self.winStatus == .closeWindow {
            self.winStatus == .openWindow
        } else {
            self.winStatus == .closeWindow
        }
    }
    mutating func EngStatusChange () {
        if self.engStatus == .startEngine {
            self.engStatus == .stopEngine
        } else {
            self.engStatus == .startEngine
        }
    }
}

class trunkCar: Car {
    var  winStatus: actWindow
    var engStatus: actEngine
    var brand: String
    var year: Int
    var cargo: Int
    
    init(brand: String, year: Int, winStatus: actWindow,engStatus: actEngine, cargo: Int) {
        self.brand = brand
        self.year = year
        self.winStatus = winStatus
        self.engStatus = engStatus
        self.cargo = cargo
    }
    
}
class sportCar: Car {
    var winStatus: actWindow
    var engStatus: actEngine
    var brand: String
    var year: Int
    var speed: Int
    
    init(brand: String, year: Int, winStatus: actWindow, engStatus: actEngine, speed: Int) {
        self.brand = brand
        self.year = year
        self.winStatus = winStatus
        self.engStatus = engStatus
        self.speed = speed
    }
    
}

extension sportCar: CustomStringConvertible {
    
    var description: String {
        return "Модель:\(brand),Год выпуска: \(year) максимальная скорость:\(speed)км/ч, \(winStatus.rawValue), \(engStatus.rawValue)"
    }
    
}
extension trunkCar: CustomStringConvertible {
    
    var description: String {
        return "Модель: \(brand), Год выпуска: \(year) Грузоподъемность: \(self.cargo)кг, \(self.winStatus.rawValue), \(self.engStatus.rawValue)"
    }
}

var car1 = sportCar (brand: "BMW", year: 2017, winStatus: .openWindow, engStatus: .stopEngine, speed: 300)
var car2 = trunkCar (brand: "Volvo", year: 2017, winStatus: .closeWindow, engStatus: .startEngine, cargo: 20000)
print(car1)
car1.WinStatusChange()
print(car1)
car1.EngStatusChange()
print(car1)
print("__________________________________________________________________________")
print(car2)
car2.EngStatusChange()
print(car2)
car2.WinStatusChange()
print(car2)
