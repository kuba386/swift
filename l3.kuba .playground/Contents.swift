/*
1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/


import Foundation

enum VehicleType: CustomStringConvertible {
    case passengerCar, truck
    
    var description: String {
        switch self {
        case .passengerCar:
            return "Седан"
        case .truck:
            return "Грузавой"
        }
    }
}

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

enum Action {
    case switchEngine(EngineStatus)
    case switchWindows(WindowsStatus)
    case loadCargo(Double)
}

struct Vehicle: CustomStringConvertible {
    let type: VehicleType
    let brand: String
    let productionYear: Int
    let maxCargoSpace: Double
    var engine: EngineStatus = .off
    var windows: WindowsStatus = .closed
    var currentCargoSpace: Double = 0
    
    var description: String {
        return "\(type) \(brand)\n Год выпуска: \(productionYear)\nСостояние: \(engine) | Загрузка \(currentCargoSpace)/\(maxCargoSpace)\n"
    }
    
    init(type:VehicleType, brand: String, productionYear:Int, maxCargoSpace:Double) {
        self.type = type
        self.brand = brand
        self.productionYear = productionYear
        self.maxCargoSpace = maxCargoSpace
    }
    
    mutating func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            windows = status
        case .loadCargo(let load):
            let expectedLoad = load + currentCargoSpace
            switch expectedLoad {
            case _ where expectedLoad > maxCargoSpace:
                currentCargoSpace = maxCargoSpace
            case _ where expectedLoad < 0:
                currentCargoSpace = 0
            default:
            currentCargoSpace += load
            }
        }
    }
}

var shkoda = Vehicle(type: .passengerCar, brand: "Shkoda Octavia", productionYear: 2018, maxCargoSpace: 5)
shkoda.perform(action: .loadCargo(3))
shkoda.perform(action: .loadCargo(-1))
shkoda.perform(action: .switchEngine(.on))
print(shkoda)

var manTruck = Vehicle(type: .truck, brand: "MAN", productionYear: 2017, maxCargoSpace: 40000)
manTruck.perform(action: .switchWindows(.opened))
manTruck.perform(action: .loadCargo(10000))
print(manTruck)
