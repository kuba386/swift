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
