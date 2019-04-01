
/*1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.*/

enum EngineStatus: CustomStringConvertible {
    case on, off
    
    var description: String {
        switch self {
        case .on:
            return "Двигатель заведен"
        case .off:
            return "Двигатель заглушен"
        }
    }
}

enum WindowsStatus: CustomStringConvertible {
    case opened, closed
    
    var description: String {
        switch self {
        case .opened:
            return "Окна открыты"
        case .closed:
            return "Окна закрыты"
        }
    }
}

enum TruckBodyType: CustomStringConvertible {
    case box, tank, refrigerator
    
    var description: String {
        switch self {
        case .box:
            return "Стандартный кузов"
        case .tank:
            return "Цистерна"
        case .refrigerator:
            return "Холодильная камера"
        }
    }
}

enum Action {
    case switchEngine (EngineStatus)
    case switchWindows(WindowsStatus)
    case loadCargo(Double)
    case attachTruckBody(TruckBodyType)
    case replaceTyres
    
}

class Car {
    let brand: String
    let productionYear: Int
    var engine: EngineStatus = .off
    var windows: WindowsStatus = .closed
    
    init(brand: String, productionYear:Int) {
        self.brand = brand
        self.productionYear = productionYear
    }
    
    func perform(action: Action) {
    }
}

class TrunkCar: Car, CustomStringConvertible {
    static let typeEmoji = "🚛"
    let maxCargoSpace: Double
    var currentCargoSpace: Double = 0
    var bady: TruckBodyType?
    
    var description: String {
    let bodyDescription = bady?.description ?? "Отцеплен"
    
        return "\(TrunkCar.typeEmoji) \(brand)\nГод выпуска: \(productionYear)\nКузов: \(bodyDescription) \(currentCargoSpace)/\(maxCargoSpace)\nСостояние: \(engine) | \(windows)\n"
}

    init(brand: String, productionYear:Int, maxCargoSpace:Double, bady:TruckBodyType?) {
        self.bady = bady
        self.maxCargoSpace = maxCargoSpace
        super.init(brand: brand, productionYear: productionYear)
}

    override func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            windows = status
        case .loadCargo(let load):
            guard bady != nil else {
                return
            }
            let expectedLoad = load + currentCargoSpace
            switch expectedLoad {
            case _ where expectedLoad > maxCargoSpace:
                currentCargoSpace = maxCargoSpace
            case _ where expectedLoad < 0:
                currentCargoSpace = 0
            default:
                currentCargoSpace += load
            }
        case .attachTruckBody(let newBody):
            self.bady = newBody
            currentCargoSpace = 0
        default:
            return
        }
    }
}

class SportCar: Car, CustomStringConvertible {
    static let typeEmoji = "🚙"
    let zeroToHundredAcceleration: Double
    let topSpeed: Int
    
    var description: String {
        return "\(SportCar.typeEmoji) \(brand)\nГод выпуска: \(productionYear)\nРазгон 0-100 км/ч: \(zeroToHundredAcceleration) c\nМаксимальная скорость: \(topSpeed) км/ч\nСостояние: \(engine) | \(windows)\n"
}

    init(brand: String, productionYear:Int, zeroToHundredAcceleration:Double, topSpeed: Int) {
        self.zeroToHundredAcceleration = zeroToHundredAcceleration
        self.topSpeed = topSpeed
        super.init(brand: brand, productionYear: productionYear)
}

    override func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            windows = status
        case .replaceTyres:
            print("Произведена замена шин!")
        default:
            return
        }
    }
}

var manTruck = TrunkCar(brand: "MAN", productionYear: 2017, maxCargoSpace: 40000, bady: nil)
manTruck.perform(action: .attachTruckBody(.tank))
manTruck.perform(action: .loadCargo(10000))
manTruck.perform(action: .switchEngine(.on))
print(manTruck)

var Shelbi = SportCar(brand: "Shelbi GT", productionYear: 2007, zeroToHundredAcceleration: 3, topSpeed: 377)
Shelbi.perform(action: .switchWindows(.closed))
Shelbi.perform(action: .replaceTyres)
Shelbi.perform(action: .switchEngine(.on))
print(Shelbi)
print(Shelbi.description)
