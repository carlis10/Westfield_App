//
//  LoserView.swift
//  Westfield_App
//
//  Created by Apps2M on 3/3/23.
//

import SwiftUI

struct LoserView: View {
    @Binding var next: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        GeometryReader{ g in
            ZStack{
                Image("Fondo-Mesa")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                VStack{
                    Image("Loser")
                        .resizable()
                        .frame(width: g.size.width/1.1, height: g.size.height/6)
                   Spacer()
                }
                Image("Wanted-Loser")
                    .resizable()
                    .frame(width: g.size.width/1.3, height: g.size.height/1.5)
            }
            
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                next = false
                dismiss()
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}
