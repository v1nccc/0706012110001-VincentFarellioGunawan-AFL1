//
//  UcWalk.swift
//  0706012110001-VincentFarellioGunawan-AFL1
//
//  Created by Vincent on 03/03/23.
//

import Foundation


// data yang perlu: nama toko
// nama cukup 1 array aja biasa
// menu setiap toko berisi: harga (ada 4 menu) : mbuat array, isi e array buat nampung tuple dari seitap spec menu
// jdi indec 1 untuk tuku2, isinya ada arrays of menu yang berisi tuple buat nampung data

// cart: berisi barang nya apa, harga berapa, jumlah berapa, berasal dari toko mana
//isi array of tuple biasa

//total 3 array
func runprogram(){
    var choice: String
    var makanans = [[("Ayam Geprek",25000),("Ayam Goreng",30000),("Nasi Sayur",23000),("Nasi Goreng",27000),("Mie Goreng",26000)],
                    [("Ayam Geprek",25000),("Ayam Goreng",30000),("Nasi Sayur",23000),("Nasi Goreng",27000),("Mie Goreng",26000)]]
    var cart: [[(String, Int, Int)]] = [[],[],[],[]]
    repeat {
    print("Welcome to UC Walk Cafetaria")
    print("Please Choose Cafetaria:")
    print("""

[1] Tuku-Tuku
[2] Gotie
[3] Madame Liy
[4] Kopte
-
[S]hopping Cart
[Q]uit
Your Cafetaria Choice?
""")

choice = readLine()!
print(choice)
    
    if (choice == "1") {
        print("Hi! Welcome to Tuku-Tuku" )
        var foodchoice: String?
        repeat{
            var i = 1
            for food in makanans[1]{
                print(i,". " + food.0 + ": ", food.1)
                i += 1
            }
            print("[B]ack")
            print("Choose your food: ")
            foodchoice = readLine()
            if(foodchoice != "b"){
                print("How Many Food do you want?: ")
                var how_manyfood = Int(readLine()!)!
                var total = (makanans[Int(choice)!-1][Int(foodchoice!)!-1].1)*(how_manyfood)
                print("You will spend: ", total)
                print("Proceed? (Y/N)")
                var yorn = readLine()
                if(yorn!.lowercased() == "y"){
                    cart[0].append((makanans[Int(choice)!-1][Int(foodchoice!)!-1].0,how_manyfood,total))
                    print("Berhasil Ditambahkan ke keranjang!")
                }
                else   {
                    print("Pesanan dibatalkan")
                }}}while(foodchoice?.lowercased() != "b")
    }
    else if (choice == "2") {
        print("Hi! Welcome to Gotie")
      }
    else if (choice == "3") {
        print("Hi! Welcome to Liy")
      }
    else if (choice == "4") {
        print("Hi! Welcome to Kopte")
      }
    else if (choice.lowercased() == "s") {
        print("Hi! Welcome to Shopping cart")
        if(cart[0].isEmpty && cart[1].isEmpty && cart[2].isEmpty && cart[0].isEmpty){
            print("You haven't bought anything yet")
        }
        else{
            var totalpayment = 0
            if(!cart.isEmpty)
            {
                print("Tuku-Tuku:")
                for tukus in cart[0]{
                    print(tukus.0)
                    print(tukus.1)
                    print(tukus.2)
                    totalpayment += tukus.2
                }}
            
            
            print("Total pembayaran yang harus dilakukan:" , totalpayment)
           
        }
      }
    
       
    } while choice.lowercased() != "q"
    
}

