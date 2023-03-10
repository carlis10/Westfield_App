//
//  CellInventoryListView.swift
//  Westfield_App
//
//  Created by Apps2M on 10/2/23.
//

import SwiftUI

struct CellInventoryListView: View {
    var item: Items
    var body: some View {
        VStack{
            if item._image != nil{
                if item._description == "s"{
                    item._image!
                        .resizable()
                        .frame(width: 100, height: 50)
                        .padding(.top,40)
                    StrokeText(text: item._name.uppercased(),width: 0.5,color: Color.black)
                        .font(.custom("CowboyMovie", size: 30))
                        .foregroundColor(Color.white)
                        .padding(.top,40)
                }
                else{
                    
                    item._image!
                        .resizable()
                        .frame(width: 130, height: 40)
                        .padding(.top,45)
                    StrokeText(text: item._name.uppercased(),width: 0.5,color: Color.black)
                        .font(.custom("CowboyMovie", size: 30))
                        .foregroundColor(Color.white)
                        .padding(.top,45)
                }
                
            }
            else
            {
                Image("Question-Icon")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 1), radius: 5, x: -1, y: 5)
                    .padding(.top,20)
                StrokeText(text: item._name.uppercased(),width: 0.5,color: Color.black)
                    .font(.custom("CowboyMovie", size: 30))
                    .foregroundColor(Color.white)
            }
            
            
            
        }.frame(width: 200, height: 175)
    }
}


