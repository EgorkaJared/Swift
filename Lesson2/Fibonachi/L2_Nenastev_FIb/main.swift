//
//  main.swift
//  L2_Nenastev_FIb
//
//  Created by Егор Ненастьев on 02.05.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

print("Программа вываодит на экран массив из чисел Фибоначи, длинну массива задаете вы")

func variable (name:String) -> Int //функция проверки введеное положительное целое число
{
    print(name)
    var num:Int? = Int(readLine()!)
    while ((num == nil) || (num! <= 0))
    {
        print("Введены не коректные данные,",name)
        num = Int(readLine()!)
    }
    return(num!)
}

func fibonachi(quantity:Int)
{
    var fib = [Decimal]()// в погоне за точностью выбрал Decimal,  с Double можно вывести больш(1477) значений без манипуляций, но менее точгых
    for i in 0..<quantity
    {
       if i == 0
        {
            fib.append(0)
        }
        else if i == 1
        {
            fib.append(1)
        }
        else
        {
        let key:Decimal = fib[i-1] + fib[i-2]
            if key.isNaN
            {
                  break
            }
            fib.append(key)
        }
    }
print(fib)
print("Выведено",fib.count,"чисел")
}

let numbers: Int = variable(name: "Сколько чисел фибоначи вывести на экран?")
let startTime = clock()
fibonachi(quantity:  numbers)
let endTime = clock()
print("Swift:\t \(endTime - startTime) ns")


//альтернативный вариант с рекурсивной функцией, не эфекимвно при большой длинне массива , больше 30 закоментил чтобы не выполнялось

/*var fib2 = [Double]()

for i in 0..<(variable(name: "Сколько чисел фибоначи вывести на экран?"))
{
    
func fibonachi2(num:Int) -> Double
{
    if num == 0
    {
        return(0)
    }
    else if num == 1
    {
        return(1)
    }
    return (fibonachi2(num: num - 1) + fibonachi2(num: num - 2))
}
fib2.append(fibonachi2(num: i))
}
print(fib2)
*/

