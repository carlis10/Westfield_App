//
//  ProfileView.swift
//  Westfield_App
//
//  Created by Apps2M on 14/2/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            ZStack{
                Color.init(hex: "111111")
                    .edgesIgnoringSafeArea(.all)
                Color.init(hex: "F3F0E9")
                
                ScrollView(showsIndicators: false){
                    
                    SteamNetwork.currentUser?.GetAvatar()
                        .resizable()
                        .frame(width: 125, height: 125)
                        .overlay(
                            // Add the outline
                            
                            RoundedRectangle(cornerRadius: 0)
                                .stroke(Color.black, lineWidth: 4)
                        )
                        .padding()
                    ZStack{
                        Image("fondo3")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text(SteamNetwork.currentUser?.userName.uppercased() ?? "Nameless".uppercased())
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    ZStack{
                        Image("fondo3")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text("Deaths".uppercased())
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo2")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text(SteamNetwork.currentUser?.stats?.deaths ?? "0")
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo3")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text("Kills".uppercased())
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo2")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text(SteamNetwork.currentUser?.stats?.kills ?? "0")
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo3")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text("assistances".uppercased())
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo2")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text(SteamNetwork.currentUser?.stats?.kills ?? "0")
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo3")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text("time played".uppercased())
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                    ZStack{
                        Image("fondo2")
                            .resizable()
                            .frame(width: 250, height: 70)
                        Text(SteamNetwork.currentUser?.stats?.timePlayed ?? "0")
                            .font(.custom("CowboyMovie", size: 30))
                            .foregroundColor(Color.white)
                    }
                    .padding(1)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action: {SteamNetwork.LogoutSteamAccount()
                        dismiss()
                    }){
                        Text("LOGOUT")
                            .font(.custom("CowboyMovie", size: 40))
                            .foregroundColor(Color.init(hex: "EEEEEE"))
                    }
                }
                
                
            }
            
        }
        .onAppear(){
            DispatchQueue.main.async{
                SteamNetwork.LoadSteamUser()
            }
        }
        
        
    }
}
