//
//  UcWalk.swift
//  0706012110001-VincentFarellioGunawan-AFL1
//
//  Created by Vincent on 03/03/23.
//

import Foundation


var makanans = [
    [("Ayam Geprek",25000),("Ayam Goreng",30000),("Nasi Sayur",23000),("Nasi Goreng",27000),("Mie Goreng",26000)],
    [("Soto Ayam",21000),("Rawon",23000),("Nasi Campur",29000),("Indomie Sosis Telur",15000),("Sop Ayam",24000)],
    [("Happy Machiato",30000),("Americano",25000),("Frappucino",31000),("Arabica Coffee",22000),("White Coffee",20000)],
    [("Air Mineral",5000),("Cheetos",15000),("Pop Mie",9000),("Tahu Isi",12000),("Oreo",5000)]
]
var cart: [[(String, Int, Int)]] = [[],[],[],[]]

// data yang perlu: nama toko
// nama cukup 1 array aja biasa
// menu setiap toko berisi: harga (ada 4 menu) : mbuat array, isi e array buat nampung tuple dari seitap spec menu
// jdi indec 1 untuk tuku2, isinya ada arrays of menu yang berisi tuple buat nampung data

// cart: berisi barang nya apa, harga berapa, jumlah berapa, berasal dari toko mana
//isi array of tuple biasa

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
print(choice)
    
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
            var cartchoice: String
            repeat{
            print("Hi! Welcome to Shopping cart")
            if(cart[0].isEmpty && cart[1].isEmpty && cart[2].isEmpty && cart[0].isEmpty){
                print("You haven't bought anything yet")
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
                    }}
                if(!cart[2].isEmpty)
                {
                    print("Kopte:")
                    var a = 1
                    for pesan in cart[2]{
                        print(a , ". " , pesan.0, " | Jumlah: " , pesan.1 , " | Total Harga: " , pesan.2)
                        totalpayment += pesan.2
                    }}
                if(!cart[3].isEmpty)
                {
                    print("Tuku-Tuku:")
                    var a = 1
                    for pesan in cart[3]{
                        print(a , ". " , pesan.0, " | Jumlah: " , pesan.1 , " | Total Harga: " , pesan.2)
                        totalpayment += pesan.2
                    }}
                
                print("\n Total pembayaran yang harus dilakukan:" , totalpayment)
                print("Enter the amount of yout money:", terminator: "")
                var paymoney = Int(readLine()!)!
                if(paymoney<totalpayment){
                    print("Uang anda tidak cukup!")
                }
                else{
                    print("Transaksi Berhasil!")
                    cart[0].removeAll()
                    cart[1].removeAll()
                    cart[2].removeAll()
                    cart[3].removeAll()
                }
               
            }
                
                print("Type return to go to main screen")
                cartchoice = readLine()!
            }while(cartchoice.lowercased() != "return")
      }
    
       
    } while choice.lowercased() != "q"
    
}

public func instore(choice:Int){
    var foodchoice: String?
    repeat{
        var i = 1
        for food in makanans[1]{
            print(i,". " + food.0 + ": ", food.1)
            i += 1
        }
        print("[B]ack")
        print("Choose your food: ", terminator: "")
        foodchoice = readLine()
        if(foodchoice != "b"){
            print("How Many Food do you want?: ", terminator: " ")
            let how_manyfood = Int(readLine()!)!
            let total = (makanans[Int(exactly: choice)!-1][Int(foodchoice!)!-1].1)*(how_manyfood)
            print("You will spend: ", total)
            print("Proceed? (Y/N): ", terminator: "")
            let yorn = readLine()
            if(yorn!.lowercased() == "y"){
                cart[Int(exactly: choice)!-1].append((makanans[Int(exactly: choice)!-1][Int(foodchoice!)!-1].0,how_manyfood,total))
                print("Berhasil Ditambahkan ke keranjang!")
            }
            else   {
                print("Pesanan dibatalkan")
            }}}while(foodchoice?.lowercased() != "b")
}

