//
//  SplashView.swift
//  Westfield_App
//
//  Created by Apps2M on 21/2/23.
//

import SwiftUI

struct SplashView: View {
    @Binding var sca: CGFloat
    var body: some View {
        ZStack{
            Color.init(hex: "F3F0E9")
                .edgesIgnoringSafeArea(.all)
            Image("Icon-Remastered")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(x: sca, y: sca)
        }
    }
}

struct AnimationSplash: View{
    @State var sca : CGFloat = 0
    @State var acess = false
    
    func Scale(){
        withAnimation(.linear(duration: 0.5)){
            sca = 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
          acess = true
        }
        
    }
    var body: some View{
        if !acess{
            SplashView(sca: $sca)
                .onAppear(){
                    Scale()
                }
            
        }else{
             LoginView()
        }
    }
}
