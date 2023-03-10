//
//  GameView.swift
//  Westfield_App
//
//  Created by Apps2M on 22/2/23.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    @State private var buttonWidth: CGFloat = 0
    @State private var paddingTopCards: CGFloat = 0
    @State private var paddingTop: CGFloat = 0
    @State private var cardPositionU: [CGFloat] = [0,0,0,0]
    @State private var cardPositionIA: [CGFloat] = [0,0,0,0]
    @State private var cardRotation: [CGFloat] = [90,90,90]
    @State private var hideCard: Bool = true
    @State private var positionX1: CGFloat = 0
    @State private var positionX2: CGFloat = 0
    @State private var positionX3: CGFloat = 0
    @State private var positionX4: CGFloat = 0
    @State private var apuesta: Double = 0
    @State private var round: Int = 0
    @State private var hide: Bool = false
    
    @State private var lose: Bool = false
    @State private var win:Bool = false
    @State private var inGame:Bool = true
    
    @State var cartasIA: [Card] = []
    @State var cartasU: [Card] = []
    @State var userPoints: Int = 0
    @State var iaPoints:Int = 0
    
    @State var cartasFisicasIA: [CardView] = []
    @State var dinero: Double = 560
    
    @Binding var pop: Bool
    @State var animationBool: Bool = true
    
    func TextAnimation(){
        withAnimation(.linear(duration: 1.5)){
            animationBool.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
            TextAnimation()
        }
    }
    
    func Lose(){
        ShowCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            lose = true
        }
    }
    
    func Win(){
        ShowCards()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            win = true
        }
        
    }
    
    func ShowCards(){
        var cards: [CardView] = []
        hide = true
        for x in 0...3{
            let carta = CardView(width: buttonWidth * 0.8, height: buttonWidth * 1.6 * 0.8, ImageFront: cartasFisicasIA[x].ImageFront, flip: true)
            cards.append(carta)
        }
        cartasFisicasIA.removeAll()
        for card in cards {
            cartasFisicasIA.append(card)
        }
        inGame = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) { [self] in
          hide = false
        }
    }
    
    func ComprobarIA(){
        
        if iaPoints <= 21{
            if iaPoints > userPoints{
                Lose()
            }
            else if iaPoints == 0{
                lose = true
            }
            else {
                Win()
            }
        }else{
            Win()
        }
    }
    
    func GenerarCartas(){
        for _ in 0...3 {
            let card: Card = Card(tipo: nil, valor: nil, front: nil)
            card._valor = valorCard.allCases.randomElement()
            card._tipo = tipeCard.allCases.randomElement()
            card._front = Image(card.SelecionarImg())
            cartasU.append(card)
        }
        for _ in 0...3 {
            let card: Card = Card(tipo: nil, valor: nil, front: nil)
            card._valor = valorCard.allCases.randomElement()
            card._tipo = tipeCard.allCases.randomElement()
            card._front = Image(card.SelecionarImg())
            cartasIA.append(card)
            let carta: CardView = CardView(width: buttonWidth * 0.8, height: buttonWidth * 1.6 * 0.8, ImageFront: card._front, flip: false)
            cartasFisicasIA.append(carta)
        }
        
    }
    func ComprobarPuntos(){
        switch(round){
        case 1:
            var uAs: Int = 0
            var iaAs: Int = 0
            for x in 0...1 {
                if cartasU[x].CalcValor() != 0{
                    userPoints += cartasU[x].CalcValor()
                } else{
                    uAs += 1
                }
            }
            if uAs == 1{
                if userPoints + 11 > 21{
                    userPoints += 1
                } else{
                    userPoints += 11
                }
            } else if uAs > 1{
                userPoints += 1 * uAs
            }
            for x in 0...1 {
                if cartasIA[x].CalcValor() != 0{
                    iaPoints += cartasIA[x].CalcValor()
                } else{
                    iaAs += 1
                }
            }
            if iaAs == 1{
                if iaPoints + 11 > 21{
                    iaPoints += 1
                } else{
                    iaPoints += 11
                }
            } else if iaAs > 1{
                iaPoints += 1 * iaAs
            }
            return
        case 2:
            var uAs: Int = 0
            var iaAs: Int = 0
            for x in 0...2 {
                if cartasU[x].CalcValor() != 0{
                    userPoints += cartasU[x].CalcValor()
                } else{
                    uAs += 1
                }
            }
            if uAs == 1{
                if userPoints + 11 > 21{
                    userPoints += 1
                } else{
                    userPoints += 11
                }
            } else if uAs > 1{
                userPoints += 1 * uAs
            }
            for x in 0...2 {
                if cartasIA[x].CalcValor() != 0{
                    iaPoints += cartasIA[x].CalcValor()
                } else{
                    iaAs += 1
                }
            }
            if iaAs == 1{
                if iaPoints + 11 > 21{
                    iaPoints += 1
                } else{
                    iaPoints += 11
                }
            } else if iaAs > 1{
                iaPoints += 1 * iaAs
            }
            return
        case 3:
            var uAs: Int = 0
            var iaAs: Int = 0
            for card in cartasU {
                if card.CalcValor() != 0{
                    userPoints += card.CalcValor()
                } else{
                    uAs += 1
                }
            }
            if uAs == 1{
                if userPoints + 11 > 21{
                    userPoints += 1
                } else{
                    userPoints += 11
                }
            } else if uAs > 1{
                userPoints += 1 * uAs
            }
            for card in cartasIA {
                if card.CalcValor() != 0{
                    iaPoints += card.CalcValor()
                } else{
                    iaAs += 1
                }
            }
            if iaAs == 1{
                if iaPoints + 11 > 21{
                    iaPoints += 1
                } else{
                    iaPoints += 11
                }
            } else if iaAs > 1{
                iaPoints += 1 * iaAs
            }
            return
        default:
            return
        }
    }
    
    var body: some View {
        GeometryReader{ g in
            ZStack{
                Color.init(hex: "402B25")
                    .edgesIgnoringSafeArea(.all)
                Image("Table-BlackJack (2)")
                    .resizable()
                    .frame(width: g.size.width, height: g.size.height + g.safeAreaInsets.top/2)
                HStack{
                    ZStack{
                        if round >= 1{
                            CardView(width: buttonWidth * 0.8, height: buttonWidth * 1.6 * 0.8,ImageFront: cartasU[0]._front!,flip: true)
                                .rotation3DEffect(Angle(degrees: cardRotation[0]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX1, y: cardPositionU[0])
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            CardView(width: buttonWidth * 0.8, height: buttonWidth * 1.6 * 0.8,ImageFront: cartasU[1]._front!,flip: true)
                                .rotation3DEffect(Angle(degrees: cardRotation[0]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX2, y: cardPositionU[1])
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            
                            if !hide{
                            cartasFisicasIA[0]
                                .rotation3DEffect(Angle(degrees: cardRotation[0]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX1, y: cardPositionIA[0])
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            
                            cartasFisicasIA[1]
                                .rotation3DEffect(Angle(degrees: cardRotation[0]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX2, y: cardPositionIA[1])
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            }
                        }
                        if round >= 2{
                            CardView(width: buttonWidth * 0.8, height: buttonWidth * 1.6 * 0.8,ImageFront: cartasU[2]._front!,flip: true)
                                .rotation3DEffect(Angle(degrees: cardRotation[1]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX3, y: cardPositionU[2])
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            
                            if !hide{
                            cartasFisicasIA[2]
                                .rotation3DEffect(Angle(degrees: cardRotation[1]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX3, y: cardPositionIA[2])
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                                
                            }
                        }
                        if round >= 3{
                            CardView(width: buttonWidth * 0.8, height: buttonWidth * 1.6 * 0.8,ImageFront: cartasU[3]._front!,flip: true)
                                .rotation3DEffect(Angle(degrees: cardRotation[2]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX4, y: cardPositionU[3])
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            if !hide{
                            cartasFisicasIA[3]
                                .rotation3DEffect(Angle(degrees: cardRotation[2]), axis: (x: 0, y: 0, z: 1))
                                .offset(x: positionX4, y: cardPositionIA[3])
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            }
                        }
                        if inGame{
                            if animationBool{
                        Text("TAP TO GET CARDS")
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                                .padding(.bottom,g.size.height * 0.2)
                                
                            }
                        }
                        
                        Button(action:{
                            inGame = false
                            round += 1
                            userPoints = 0
                            iaPoints = 0
                            ComprobarPuntos()
                            if round == 1{
                                withAnimation(.easeInOut(duration: 1)){
                                    cardPositionU[0] = g.size.height / 5
                                    cardPositionU[1] = g.size.height / 5
                                    cardPositionIA[0] = -g.size.height / 4
                                    cardPositionIA[1] = -g.size.height / 4
                                    positionX1 = -g.size.width / 9
                                    positionX2 = g.size.width / 9
                                    cardRotation[0] = 0
                                }
                            }
                            if round == 2{
                                withAnimation(.easeInOut(duration: 1)){
                                    cardPositionU[2] = g.size.height / 5
                                    cardPositionIA[2] = -g.size.height / 4
                                    positionX3 = g.size.width / 9 * 3
                                    cardRotation[1] = 0
                                }
                            }
                            if round == 3{
                                withAnimation(.easeInOut(duration: 1)){
                                    cardPositionU[3] = g.size.height / 5
                                    cardPositionIA[3] = -g.size.height / 4
                                    positionX4 = g.size.width / 9 * 5
                                    cardRotation[2] = 0
                                }
                            }
                            
                                if userPoints > 21{
                                    inGame = false
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                                        Lose()
                                    }
                                    
                                }
                                else if userPoints == 21{
                                    inGame = false
                                    Win()
                                    
                                    
                                } else{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                                        if round != 3{
                                            inGame = true
                                            
                                        } else{
                                            ComprobarIA()
                                        }
                                    }
                                }
                            
                        }){
                            Image("Baraja")
                                .resizable()
                                .frame(width: buttonWidth * 1.5, height: buttonWidth)
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                                .padding()
                            
                        }.disabled(!inGame)
                    }
                    ZStack{
                    Image("Linea-Mesa")
                        .resizable()
                        .frame(width: buttonWidth * 1.5, height: buttonWidth)
                        .padding()
                        
                        Text("\(apuesta.redondear(numeroDeDecimales: 2))" + "$")
                            .foregroundColor(Color.init(hex: "EEEEEE"))
                            .font(.custom("CowboyMovie", size: 50))
                            .padding()
                    }
                }
                Button(action:{
                    ComprobarIA()
                }){
                    Text("SHOW CARDS")
                        .font(.custom("CowboyMovie", size: paddingTop))
                        .foregroundColor(Color.init(hex: "EEEEEE"))
                        .padding()
                }
                .disabled(!inGame)
                .background(Color.init(hex: "610B0E"))
                .overlay{
                    RoundedRectangle(cornerRadius: 60)
                        .stroke(Color.black, lineWidth: 5)
                }
                .cornerRadius(60)
                .padding(.top,paddingTopCards - 100)
                
                HStack(spacing:10){
                    Button(action:{
                        let precio : Double = 1
                        if dinero >= precio{
                            apuesta += precio
                            dinero -= precio
                            
                        }
                    }){
                        Image("Ficha-1")
                            .resizable()
                            .frame(width: buttonWidth / 2, height: buttonWidth / 2)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                    }.disabled(!inGame)
                    Button(action:{
                        let precio: Double = 2.5
                        if dinero >= precio{
                            apuesta += precio
                            dinero -= precio
                            
                        }
                    }){
                        Image("Ficha-2.5")
                            .resizable()
                            .frame(width: buttonWidth / 2, height: buttonWidth / 2)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                        
                    } .padding(.top,paddingTop)
                        .disabled(!inGame)
                    Button(action:{
                        let precio: Double = 5
                        if dinero >= precio{
                            apuesta += precio
                            dinero -= precio
                            
                        }
                    }){
                        Image("Ficha-5")
                            .resizable()
                            .frame(width: buttonWidth / 2, height: buttonWidth / 2)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                        
                    } .padding(.top,paddingTop * 2)
                        .disabled(!inGame)
                    Button(action:{
                        let precio: Double = 25
                        if dinero >= precio{
                            apuesta += precio
                            dinero -= precio
                            
                        }
                    }){
                        Image("Ficha-25")
                            .resizable()
                            .frame(width: buttonWidth / 2, height: buttonWidth / 2)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                        
                    } .padding(.top,paddingTop)
                        .disabled(!inGame)
                    Button(action:{
                        let precio: Double = 100
                        if dinero >= precio{
                            apuesta += precio
                            dinero -= precio
                            
                        }
                    }){
                        Image("Ficha-100")
                            .resizable()
                            .frame(width: buttonWidth / 2, height: buttonWidth / 2)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                        
                    }.disabled(!inGame)
                }.padding(.top,paddingTopCards)
                Text("\(userPoints)")
                    .font(.custom("CowboyMovie", size: 50))
                    .foregroundColor(Color.init(hex: "EEEEEE"))
                NavigationLink(destination: LoserView(next: $pop), isActive: $lose){
                    Text("")
                }
                NavigationLink(destination: WinnerView(next: $pop), isActive: $win){
                    Text("")
                }
            }
            .padding(.top,50)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement:.navigationBarLeading){
                    Button(action:{dismiss()}){
                        Image("Return")
                            .resizable()
                            .frame(width: buttonWidth, height: buttonWidth / 2)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 5, x: 0, y: 3)
                            .padding(.horizontal)
                    }.disabled(!inGame)
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Text("\(dinero.redondear(numeroDeDecimales: 2))$")
                        .font(.custom("CowboyMovie", size: 40))
                        .foregroundColor(Color.white)
                        .padding()
                    
                }
            }.ignoresSafeArea(.all)
                .onAppear(){
                    if g.size.height <= 700{
                        self.buttonWidth = 60
                        self.paddingTopCards = g.size.width
                        self.paddingTop = 20
                    } else{
                        self.buttonWidth = 100
                        self.paddingTopCards = g.size.width * 1.4
                        self.paddingTop = 30
                    }
                }
        }.onAppear(){
            TextAnimation()
            GenerarCartas()
        }
        
    }
}
