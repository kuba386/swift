



//1. Написать функцию, которая определяет, четное число или нет.

func number (_ number1: Int) -> () {
    var n: Int = number1
    n = n % 2
    if (n == 0) {
        print("число чётное")
    } else {
        print("число нечётное")
    }
}

number(8)
number(7)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isValDevisdesByThreeWithoutReminder(val:Int)->Bool{
    return val % 3 == 0 ? true : false
}

isValDevisdesByThreeWithoutReminder(val: 6)
isValDevisdesByThreeWithoutReminder(val: 5)

// 3. Создать возрастающий массив из 100 чисел.

var array = Array(1...100)
print("Исходный массив: \(array)\n")

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

func removeTwoThree(_ removedTwoTree: [Int]) -> [Int] {
    var x = removedTwoTree
    for (_, value) in x.enumerated() {
        if (value % 2) == 0 || (value % 3) != 0 {
            x.remove(at: x.index(of: value)!)
        }
    }
    return x
}

print(removeTwoThree(array))

//5.*Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func addFibonacciNumber(to array: inout[Int]) {
    switch array {
    case _ where array.isEmpty:
        array.append(0)
    case _ where array.count == 1:
        array.append(array[0] == 0 ? 1 : array[0])
    default:
        let lastItem = array[array.endIndex - 1]
        let penultimateItem = array[array.endIndex-2]
        guard !lastItem.addingReportingOverflow(penultimateItem).overflow else {
            break
        }
        array.append(lastItem+penultimateItem)
    }
}
