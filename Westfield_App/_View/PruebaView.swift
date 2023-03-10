//
//  PruebaView.swift
//  Westfield_App
//
//  Created by Apps2M on 13/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var name:String = ""
    @State var pass:String = ""
    @State var terminos:Bool = false
    var body: some View{
        NavigationView{
        ZStack{
            Color.init(red: 0.51, green: 0.42, blue: 0.173)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:0){
                Text("WESTFIELD")
                    .font(.title.bold())
                    .foregroundColor(Color.white)
                Divider()
                VStack{
                    Text("Iniciar Sesión")
                        .font(.title.bold())
                        .foregroundColor(Color.black)
                        .padding(5)
                    TextField("Nombre de usuario", text: $name)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                        .overlay(
                        // Add the outline
        
                        RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(10)
                    TextField("Contraseña", text: $pass)
                    .padding(5)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                    .overlay(
                    // Add the outline
    
                    RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(10)
                    
                    Toggle(isOn: $terminos){
                        Text("Aceptar terminos y condiciones")
                    } .padding()
                    NavigationLink(destination: NavigationBarView()){
                        Text("Acceder")
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .cornerRadius(30)
                    }.padding(1)
                    
                    Button(action:{}){
                        Image("Steam_Icon")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                    }.padding(5)
                        .shadow(color: Color.black, radius: 2, x: 1, y: 1)
                }
                    .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color.init(red: 0.945, green: 0.886, blue: 0.667))
                    )
                    .padding()
                    
            }
        }
        }.navigationBarHidden(true)
    }
}

struct PruebaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
