//
//  main.swift
//  L1_ Nenastev_X^2
//
//  Created by Егор Ненастьев on 30.04.2020.
//  Copyright © 2020 Егор Ненастьев. All rights reserved.
//

import Foundation

print("Данная программа решает квадратное уравнение вида ax^2+bx+c=0")
func variable (name:String) -> Double
{
    print("Введите значение параметра", name)
    let inPut: String? = readLine()
    while inPut == nil
    {
    print("Введены не коректные данные, положительное введите число. Введите",name)
    let _: String? = readLine()
    }
    var num:Double? = Double(inPut!)
    while (num == nil)
    {
        print("Введены не коректные данные для парметра,",name,"введите число")
        num = Double(readLine()!)
    }
    return(num!)
}

let a:Double = variable(name: "<a>")
let b:Double = variable(name: "<b>")
let c:Double = variable(name: "<c>")

print("Уравнение имеет вид",a,"*x^2+",b,"*x+",c,"=0")

var D:Double = pow(b,2)-4*a*c

if (D < 0)
{
   print("Уравнение не имеет действительных корней")
}
else
{
    if (D == 0)
    {
        let x: Double = -b/(2*a)
       print("Уравнение имеет один корень X=",String(format:"%.2f", x))
    }
    else
    {
        let x1:Double = (-b+sqrt(D))/(2*a)
        let x2:Double = (-b-sqrt(D))/(2*a)
        print("Уравнение имеет два кореня X1=",String(format:"%.2f", x1),"и  x2=",String(format:"%.2f", x2))
    }
}

