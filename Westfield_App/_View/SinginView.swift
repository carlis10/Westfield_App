//
//  SinginView.swift
//  Westfield_App
//
//  Created by Apps2M on 9/2/23.
//

import SwiftUI

struct SinginView: View {
    @State var name:String = ""
    @State var pass:String = ""
    @State var cPass:String = ""
    @State var acess:Bool = false
    @State var remember:Bool = false
    var body: some View {
        VStack{
            Text("Sing in")
                .font(.title)
            TextField("Username",text: $name)
                .padding(5)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                .overlay(
                // Add the outline

                RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black, lineWidth: 1)
                )
                .padding()
            TextField("Password",text: $pass)
                .padding(5)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                .overlay(
                // Add the outline

                RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black, lineWidth: 1)
                )
                .padding()
            TextField("Confirm password",text: $cPass)
                .padding(5)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.4), radius: 5, x: 0, y: 3)
                .overlay(
                // Add the outline

                RoundedRectangle(cornerRadius: 30)
                .stroke(Color.black, lineWidth: 1)
                )
                .padding()
            Toggle("Terms and conditions",isOn: $acess).padding()
            Toggle("Remember me",isOn: $remember)
                .padding()
            Button(action:{}){
                Text("Confirmar")
            }.padding()
        }
    }
}

struct SinginView_Previews: PreviewProvider {
    static var previews: some View {
        SinginView()
    }
}
