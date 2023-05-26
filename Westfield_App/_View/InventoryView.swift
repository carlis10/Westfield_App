//
//  InventoryView.swift
//  Westfield_App
//
//  Created by Apps2M on 10/2/23.
//

import SwiftUI

struct InventoryView: View {
    @State var search:String = ""
    @State var primaryInventory = [
        Items(name: "RIFLE", image:  Image("Primary-Weapon"), dateUnlocked: nil, description: "p"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 2"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 3"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 4"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 5")]
    @State var secundaryInventory = [
        Items(name: "REVOLVER", image:  Image("Secundary-Weapon-1"), dateUnlocked: nil, description: "s"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 2"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 3"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 4"),
        Items(name: "???", image:  nil, dateUnlocked: nil, description: "Prueba numero 5")]
    
    var body: some View {
        GeometryReader{g in
            ZStack{
                Color.init(hex: "F3F0E9")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    
                    Image("Inventory")
                        .resizable()
                        .frame(width: 250, height: 50)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 5, x: 0, y: 3)
                        .padding()
                    Image("fondo3")
                        .resizable()
                        .frame(width: g.size.width * 0.95, height: 20)
                    ScrollView(showsIndicators: false){
                        Text("PRIMARY")
                            .font(.custom("CowboyMovie", size: 50))
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing:20){
                                ForEach(primaryInventory){ item in
                                    CellInventoryListView(item: item)
                                        .background(Image("Item-Image")
                                            .resizable()
                                            .frame(width: 200, height: 175))
                                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 3, x: 0, y: 0)
                                }
                            }
                        }.padding()
                        Text("SECONDARY")
                            .font(.custom("CowboyMovie", size: 50))
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing:20){
                                ForEach(secundaryInventory){ item in
                                    CellInventoryListView(item: item)
                                        .background(Image("Item-Image")
                                            .resizable()
                                            .frame(width: 200, height: 175))
                                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 3, x: 0, y: 0)
                                }
                            }
                        }.padding()
                    }
                }
            }
            
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InventoryView()
        }
    }
}
