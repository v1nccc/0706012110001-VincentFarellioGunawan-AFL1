//
//  UcWalk.swift
//  0706012110001-VincentFarellioGunawan-AFL1
//
//  Created by Vincent on 03/03/23.
//

import Foundation

// untuk mendaftar menu
var cartchoice = ""
var makanans = [
    [("Ayam Geprek",25000),("Ayam Goreng",30000),("Nasi Sayur",23000),("Nasi Goreng",27000),("Mie Goreng",26000)],
    [("Soto Ayam",21000),("Rawon",23000),("Nasi Campur",29000),("Indomie Sosis Telur",15000),("Sop Ayam",24000)],
    [("Happy Machiato",30000),("Americano",25000),("Frappucino",31000),("Arabica Coffee",22000),("White Coffee",20000)],
    [("Air Mineral",5000),("Cheetos",15000),("Pop Mie",9000),("Tahu Isi",12000),("Oreo",5000)]
]

// untuk masuk
var cart: [[(String, Int, Int)]] = [[],[],[],[]]

//total 3 array
func runprogram(){
    var choice: String
    repeat {
    print("Welcome to UC Walk Cafetaria")
    print("Please Choose Cafetaria:")
    print("""

    [1] Madam Liy
    [2] Gotie
    [3] Kopte
    [4] Tuku-Tuku
    -
    [S]hopping Cart
    [Q]uit
    Your Cafetaria Choice?
    """, terminator: "")

choice = readLine()!
    
    if (choice == "1") {
        print("Hi! Welcome to Madam Liy" )
        instore(choice: 1)
    }
    else if (choice == "2") {
        print("Hi! Welcome to Gotie")
        instore(choice: 2)
      }
    else if (choice == "3") {
        print("Hi! Welcome to Kopte")
        instore(choice: 3)
      }
    else if (choice == "4") {
        print("Hi! Welcome to Tuku-Tuku")
        instore(choice: 4)
      }
        else if (choice.lowercased() == "s") {
            repeat{
            print("\nHi! Welcome to Shopping cart")
            if(cart[0].isEmpty && cart[1].isEmpty && cart[2].isEmpty && cart[0].isEmpty){
                print("\n!!! You haven't bought anything yet !!!")
            }
            else{
                var totalpayment = 0
                if(!cart[0].isEmpty)
                {
                    print("Madam Liy:")
                    var a = 1
                    for pesan in cart[0]{
                        print(a , ". " , pesan.0, " | Jumlah: " , pesan.1 , " | Total Harga: " , pesan.2)
                        totalpayment += pesan.2
                        a+=1
                    }}
                
                if(!cart[1].isEmpty)
                {
                    print("Gotie:")
                    var a = 1
                    for pesan in cart[1]{
                        print(a , ". " , pesan.0, " | Jumlah: " , pesan.1 , " | Total Harga: " , pesan.2)
                        totalpayment += pesan.2
                        a += 1
                    }}
                if(!cart[2].isEmpty)
                {
                    print("Kopte:")
                    var a = 1
                    for pesan in cart[2]{
                        print(a , ". " , pesan.0, " | Jumlah: " , pesan.1 , " | Total Harga: " , pesan.2)
                        totalpayment += pesan.2
                        a += 1
                    }}
                if(!cart[3].isEmpty)
                {
                    print("Tuku-Tuku:")
                    var a = 1
                    for pesan in cart[3]{
                        print(a , ". " , pesan.0, " | Jumlah: " , pesan.1 , " | Total Harga: " , pesan.2)
                        totalpayment += pesan.2
                        a += 1
                    }}
                var choice: String
                repeat{
                    print("\n Total pembayaran yang harus dilakukan:" , totalpayment)
                    print("Press [P] to pay")
                    print("Press [B]ack to go back")
                    print("Your choice? " , terminator: "")
                     cartchoice = ""
                    choice = readLine()!
                    if (choice.lowercased() == "b"){
                        cartchoice = "return"
                        break
                        
                    }
                    else if (choice.lowercased() == "p"){
                        break
                    }
                    else {
                        print("Invalid Input!")
                    }
                }while(true)
                
                if (choice.lowercased() == "p"){
                var done = false
                repeat{
                    print("Enter the amount of yout money:", terminator: "")
                    let paymoney = readLine()
                    if let pay = Int(paymoney!) {
                        if(pay==0){
                            print("Input tidak boleh 0!")
                        }
                        else if(pay<0){
                            print("Input jumlah yang benar!")
                        }
                        else if(pay<totalpayment){
                            print("Uang anda tidak cukup!")
                        }
                        
                        else{
                            print("Transaksi Berhasil!")
                            cart[0].removeAll()
                            cart[1].removeAll()
                            cart[2].removeAll()
                            cart[3].removeAll()
                            let kembalian = pay - totalpayment
                            print("Anda Membayar: Rp. " , pay)
                            print("Total Transaksi anda: Rp. " , totalpayment)
                            print("Anda mendapatkan kembalian: Rp. " , kembalian)
                            done = true
                            print("\n Enjoy your meals!")
                        }
                    } else {
                        print("Invalid input")
                    }}while(done==false)}
            }
                print("\nType return to go to main screen")
                if(cartchoice != "return"){
                    cartchoice = readLine()!
                }
            }while(cartchoice.lowercased() != "return")
      }
            else if(choice.lowercased() == "q"){
                print("\nThank you! Have a nice day! \n")
            }
            
        else{
            print("Invalid Input! \n")
        }
    } while choice.lowercased() != "q"
    
}

public func instore(choice:Int){
    var udahkeadd = false
    var foodchoice: String?
    repeat{
        var i = 1
        for food in makanans[choice-1]{
            print(i,". " + food.0 + ": ", food.1)
            i += 1
        }
        print("[B]ack")
        print("Choose your food: ", terminator: "")
        foodchoice = readLine()
        if(foodchoice != "b"){
            if let foodchoice = Int(foodchoice!){
                if(foodchoice > 0 && foodchoice < 6){
                var total = 0
                var how_manyfood = 0
                var udahpilihbrp = false
                    repeat{
                        print("How Many Food do you want?: ", terminator: " ")
                        var how_manyfoodd = readLine()!
                        if let how_manyfoodd = Int(how_manyfoodd){
                            if(how_manyfoodd < 1){
                                print("Input Jumlah yang benar!")
                            }
                            else{
                                total = (makanans[Int(exactly: choice)!-1][Int(exactly: foodchoice)!-1].1)*(how_manyfoodd)
                                how_manyfood = how_manyfoodd
                                udahpilihbrp =  true
                            }
                        }
                        else{
                            print("Invalid Input")
                        }
                    }while(!udahpilihbrp)
                
                var yorn = ""
                    repeat{
                        print("You will spend: ", total)
                        print("Proceed? (Y/N): ", terminator: "")
                        yorn = readLine()!
                        if(yorn.lowercased() == "y"){
                    if(!cart[choice-1].isEmpty){
                        for i in 0...cart[choice-1].count-1 {
                            if(cart[choice-1][i].0 == makanans[Int(exactly: choice)!-1][Int(exactly: foodchoice)!-1].0){
                                cart[choice-1][i].1 += how_manyfood
                                cart[choice-1][i].2 += total
                                udahkeadd = true
                                break
                            }
                        }}
                    if(!udahkeadd){
                        cart[Int(exactly: choice)!-1].append((makanans[Int(exactly: choice)!-1][Int(exactly: foodchoice)!-1].0,how_manyfood,total))
                    }
                    print("Berhasil Ditambahkan ke keranjang!")
                }
                        else if(yorn.lowercased() == "n"){
                    print("Pesanan dibatalkan")
                }
                        else{
                            print("Invalid Input")
                        }}while(yorn.lowercased() != "y" && yorn.lowercased() != "n")
            }
               
                else{
                    print("Invalid Input!")
                }
            }
        }
    }while(foodchoice?.lowercased() != "b")
}

