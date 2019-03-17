//1.Прямоугольный треуголник
let СathetA = 3
let СathetB = 4
let Yardage = (Double)(СathetA * СathetB)
let HypotenuseC = ((Double)(СathetA * СathetA) + (Double)(СathetB * СathetB))
let Perimeter = (Double)(СathetB + СathetA) + HypotenuseC

//2. Решение квадратного уравнения

let a = 5
let b = -8
let c = 3

var D = b*b - 4 * a * c
switch D {
case _ where D > 0:
    print("2 корня")
case _ where D == 0:
    print("1 корень")
    
default:
    print("корней нет")
}

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var deposit = 10000       //сумма вклада
var procent: Double = 7
procent = (procent/100)   //процент в год

var y1 = Double(deposit) + Double(deposit) * Double(procent)
var y2 = Double(y1) + Double(y1) * Double(procent)
var y3 = Double(y2) + Double(y2) * Double(procent)
var y4 = Double(y3) + Double(y3) * Double(procent)
var y5 = Double(y4) + Double(y4) * Double(procent)

print("При сумме вклада RUB", deposit)
print("Сумма вклада через 5 лет будет равна", y5, "RUB")
