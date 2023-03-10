//
//  LoginView.swift
//  Westfield_App
//
//  Created by Apps2M on 9/2/23.
//

import SwiftUI

import AlertToast

struct LoginView: View {
    @State var userName:String = ""
    @State var pass:String = ""
    @State var remember:Bool = false
    @State var authCode:String = ""
    @State var authCodeDescription:String = ""
    @State var access:Bool = false
    
    @State private var disabledInput = false
    @State private var showPopover = false
    @State private var showToast = false
    @State private var showLoading = false
    
    
    func OnPressedSendAuth(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            if SteamNetwork.errorOcurred == ErrorType.unexpected{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                    
                    showLoading = false
                    disabledInput = false
                    if SteamNetwork.logged{
                        access.toggle()
                        showPopover = false
                    }else{
                        
                        showToast = true
                        
                    }}
                
            } else{
                
                showLoading = false
                disabledInput = false
                if SteamNetwork.logged{
                    showPopover = false
                    disabledInput = true
                    
                    access.toggle()
                }else{
                    
                    
                    showToast = true
                }
                
                
                
            }
        }
    }
    
    func OnPressedLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            
            if SteamNetwork.errorOcurred == ErrorType.unexpected{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
                    
                    showLoading = false
                    disabledInput = false
                    if SteamNetwork.logged{
                        access.toggle()
                        showPopover = false
                    }else{
                        
                        if SteamNetwork.needAuthCode{
                            
                            authCodeDescription = SteamNetwork.errorOcurred.message
                            
                            showPopover = true
                            
                            showToast = true
                            
                        } else{
                            
                            showToast = true
                            
                            showPopover = false
                        }
                        
                    }}
                
            } else{
                
                showLoading = false
                disabledInput = false
                
                if SteamNetwork.logged{
                    
                    disabledInput = true
                    showPopover = false
                    
                    access.toggle()
                    
                }else{
                    
                    if SteamNetwork.needAuthCode{
                        
                        authCodeDescription = SteamNetwork.errorOcurred.message
                        
                        showPopover = true
                        
                    } else{
                        
                        showToast = true
                    }
                    
                }
                
            }
            
        }
    }
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.init(hex: "F3F0E9")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Image("Title")
                        .resizable()
                        .frame(width: 280, height: 70)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 5, x: 0, y: 3)
                        .padding()
                    Text("Login using your Steam account:")
                        .font(.subheadline)
                        .padding()
                    TextField("Username",text: $userName)
                        .padding(10)
                        .background(Color.white)
                        .autocapitalization(.none)
                        .disabled(disabledInput)
                        .disableAutocorrection(true)
                        .cornerRadius(10)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                        .overlay(
                            // Add the outline
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding()
                    
                    SecureField("Password",text: $pass)
                        .padding(10)
                        .background(Color.white)
                        .disabled(disabledInput)
                        .cornerRadius(10)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                        .overlay(
                            // Add the outline
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding()
                    HStack(spacing:5){
                        Text("Don't have a")
                            .font(.subheadline)
                        Text("Steam account?")
                            .font(.subheadline)
                            .underline(true, color:Color.black)
                            .bold()
                    }.padding()
                    
                    Button(action: {
                        
                        showPopover = false
                        showLoading = false
                        showToast = false
                        disabledInput = true
                        
                        
                        Task {
                            showLoading = true
                            
                            await SteamNetwork.SteamLogin(_userName: userName, _pass: pass)
                            
                            OnPressedLogin()
                            
                        }
                        
                    })
                    {
                        Image("login")
                            .resizable()
                            .frame(width: 120, height: 40)
                            .padding(10)
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 1)
                            .background(Color.init(hex: "610B0E"))
                        
                            .overlay(
                                // Add the outline
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .cornerRadius(50)
                        
                    }.padding(1)
                        .disabled(disabledInput)
                    NavigationLink(destination: NavigationBarView(), isActive: $access){
                        Text("")
                    }
                }
                .background(Color.init(hex: "F3F0E9"))
                .navigationBarTitleDisplayMode(.inline)
                .padding()
                
            }.navigationBarHidden(true)
        }.popover(isPresented: $showPopover){
            GeometryReader{ g in
                
                
                ZStack{
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("AUTH CODE")
                            .font(.custom("CowboyMovie", size: 80))
                            .foregroundColor(Color.init(hex: "8A090D"))
                            .padding(5)
                        Text("Auth code required")
                            .bold()
                            .foregroundColor(Color.init(hex: "F7F0D2"))
                            .padding()
                        Text("check your email or mobile device")
                            .bold()
                            .foregroundColor(Color.init(hex: "F7F0D2"))
                            .padding()
                        ZStack{
                            Image("Code-Image")
                                .resizable()
                                .frame(width: g.size.width * 0.9, height: g.size.height * 0.6)
                            TextField("Enter the code...", text: $authCode)
                                .padding(10)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                                .overlay(
                                    // Add the outline
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .padding(70)
                            
                        }.padding(5)
                        
                        Button(action:{
                            
                            showLoading = false
                            showToast = false
                            disabledInput = true
                            
                            Task {
                                
                                showLoading = true
                                
                                var codeType: String = ""
                                
                                if SteamNetwork.errorOcurred.error == "needEmail"{
                                    codeType = "email"
                                } else if SteamNetwork.errorOcurred.error == "need2fa"{
                                    codeType = "2fa"
                                }
                                
                                await SteamNetwork.SendAuthCode(_codeType: codeType, _userName: userName, _pass: pass, _authCode: authCode)
                                
                                OnPressedSendAuth()
                                
                            }
                        }){
                            Image("Confirm")
                                .resizable()
                                .frame(width: 120, height: 40)
                                .padding(10)
                                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 1)
                                .background(Color.init(hex: "610B0E"))
                                .overlay(
                                    // Add the outline
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                                .cornerRadius(50)
                            
                        }.padding(5)
                            .disabled(disabledInput)
                        
                    }
                    
                }
                
            }.toast(isPresenting: $showToast){
                AlertToast(displayMode: .alert,type: .regular, title: SteamNetwork.errorOcurred.message)
                
            }
            .toast(isPresenting: $showLoading){
                AlertToast(displayMode: .alert,type:.loading)
            }
        }
        .toast(isPresenting: $showToast){
            AlertToast(displayMode: .alert,type: .regular, title: SteamNetwork.errorOcurred.message)
            
        }
        .toast(isPresenting: $showLoading){
            AlertToast(displayMode: .alert,type:.loading)
        }.navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
