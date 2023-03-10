//
//  BlackJackView.swift
//  Westfield_App
//
//  Created by Apps2M on 17/2/23.
//

import SwiftUI

struct BlackJackView: View {
    @State var space: CGFloat = 20
    
    @State var isActive:Bool = false
    @State private var spacing: CGFloat = 0
    @State private var widthCard: CGFloat = 0
    @State private var widthPlay: CGFloat = 0
    var body: some View{
        GeometryReader{ g in
        NavigationView{
            ZStack{
                Color.brown
                    .edgesIgnoringSafeArea(.all)
                VStack{
                Image("Fondo-Mesa")
                    .resizable()
                    .ignoresSafeArea(.all)
                }
                
                VStack(spacing: spacing){
                    Image("Blackjack")
                        .resizable()
                        .frame(width: 200, height: 100)
                        .background(Image("fondo3")
                            .resizable()
                            .frame(width: 270, height: 125)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3))
                    
                    Image("Cartas")
                        .resizable()
                        .frame(width: widthCard, height: widthCard)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                       
                    ZStack{
                        Image("Linea-Mesa")
                            .resizable()
                            .frame(width: g.size.width / 1.5, height: widthPlay + 70)
                            .padding()
                        NavigationLink(destination: GameView(pop: $isActive),isActive: $isActive){
                            Image("PLAY")
                                .resizable()
                                .frame(width: widthPlay, height: widthPlay)
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                        }
                    }
                    Spacer(minLength: 50)
                }
            }
        }
        .onAppear(){
            if g.size.height <= 700{
                self.widthPlay = 80
                self.widthCard = 100
                self.spacing = 20
                
            } else{
                self.widthPlay = 100
                self.widthCard = 300
                self.spacing = 70
            }
        }
        }
    }
    
}
struct BlackJackView_Previews: PreviewProvider {
    static var previews: some View {
        BlackJackView()
    }
}
    
