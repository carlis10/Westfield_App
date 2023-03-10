//
//  CellListView.swift
//  Westfield_App
//
//  Created by Apps2M on 10/2/23.
//

import SwiftUI


//Celda Provisional
struct CellListView: View {
    @State var new:New
    var width: CGFloat = 140
    var body: some View {
            HStack{
            if new._image != nil{
                new._image!
                    .resizable()
                    .frame(width: width, height: width - width/3)
                    .cornerRadius(10)
                    .overlay(
                        // Add the outline
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                            
                    )
                    .padding()
            } else{
                Image("Question-Icon")
                    .resizable()
                    .frame(width: 50, height: 100)
                    .padding()
            }
          
            Text(new._title.uppercased())
                .font(.custom("CowboyMovie", size: 25))
                .multilineTextAlignment(.center)
                .padding()
           
            
        }.foregroundColor(Color.white)
    }
}

