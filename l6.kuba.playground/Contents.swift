/*1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.*/

struct Journal {
    var name: String
    var mark: Int
}


extension Journal: CustomStringConvertible {
    var description : String {
        return "Name: \(name), Mark: \(mark)"
    }
}


struct queue <T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func enqueue(element: T) {
        elements.append(element)
    }
    
    mutating func dequeue()->T {
        return elements.removeLast()
    }
    
    public var head: T? {
        if isEmpty {
            print("Элементы не найдены. Массив пуст.")
            return nil
        } else {
            print("Последний элемент\(elements.last!)")
            return elements.last
        }
    }
    
    public var front: T? {
        
        if isEmpty{
            print("Элементы не найдены. Массив пуст")
            return nil
        } else {
            print("Первый элемент \(elements.first!)")
            return elements.first
        }
    }
    
    func printMyQueue() {
        print(elements)
    }
}


extension queue {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var pupil = queue<Journal>()
pupil.enqueue(element: .init(name: "David", mark: 5))
pupil.enqueue(element: .init(name: "Igor", mark: 4))
pupil.enqueue(element: .init(name: "Alex", mark: 5))
pupil.enqueue(element: .init(name: "Mik", mark: 3))
pupil.enqueue(element: .init(name: "Oli", mark: 5))
pupil.enqueue(element: .init(name: "Moli", mark: 3))
pupil.enqueue(element: .init(name: "K2", mark: 4))

pupil.printMyQueue()
pupil.head
pupil.front



let honoursPupil = pupil.myFilter(predicate: {$0.mark == 5})
print(honoursPupil)
