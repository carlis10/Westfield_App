//
//  NewView.swift
//  Westfield_App
//
//  Created by Apps2M on 16/2/23.
//

import SwiftUI

struct NewView: View {
    @Environment(\.dismiss) var dismiss
    @State private var buttonWidth: CGFloat = 0
    @State var new:New
    var body: some View {
        GeometryReader{g in
        ZStack{
            Color.init(hex: "111111")
                .edgesIgnoringSafeArea(.all)
            Color.init(hex: "F3F0E9")
            ScrollView(.vertical){
            VStack{
                new._image?
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                Text(new._title)
                    .font(.custom("CowboyMovie", size: 40))
                    .padding()
                Text(new._description)
                    .font(.body)
                    .padding()
                
            }
            .navigationBarBackButtonHidden(true)
            }.toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    Button(action:{dismiss()}){
                        StrokeText(text: "RETURN",width: 0.5,color: Color.black)
                            .font(.custom("CowboyMovie", size: buttonWidth * 0.5))
                            .foregroundColor(Color.white)
                    }
                }
            }
        }.onAppear(){
            if g.size.height <= 700{
                self.buttonWidth = 60
            } else{
                self.buttonWidth = 80
            }
        }
            
        }
    }
}
