//
//  WinnerView.swift
//  Westfield_App
//
//  Created by Apps2M on 3/3/23.
//

import SwiftUI

struct WinnerView: View {
    @Binding var next: Bool
    var body: some View {
        
        GeometryReader{g in
            ZStack{
                Image("Fondo-Mesa")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                VStack{
                    Image("Winner")
                        .resizable()
                        .frame(width: g.size.width/1.1, height: g.size.height/6)
                        .padding(.bottom,g.size.height * 0.35)
                }
                
            }
        }.onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                next = false
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
        }
}
