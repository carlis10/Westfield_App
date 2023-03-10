//
//  HomeView.swift
//  Westfield_App
//
//  Created by Apps2M on 10/2/23.
//

import SwiftUI

struct HomeView: View {
    
    init () {
        UITableView.appearance().backgroundColor = UIColor(Color.init(hex: "F3F0E9"))
    }
    
    //Array provisional
    @State var newActive : New = New(title: "", description: "", image: nil)
    @State var showNew: Bool = false
    @State var searchHome: String = ""
    @State var News: [New] = []
    var body: some View {
        GeometryReader{ g in
            ZStack{
                Color.init(hex: "F3F0E9")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing:1){
                    
                    Image("News")
                        .resizable()
                        .frame(width: 140, height: 70)
                        .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 5, x: 0, y: 3)
                        .padding()
                    HStack{
                        //Aparece solo si eres admin
                        NavigationLink(destination: CreateNewView()){
                            Image("+")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(1)
                        }.padding(.leading,g.size.width * 0.75)
                        
                    }
                    .font(.title2)
                    Image("fondo3")
                        .resizable()
                        .frame(width: g.size.width * 0.95, height: 20)
                    List(News){new in
                        Section{
                            CellListView(new: new)
                            
                        }.listRowBackground(Image("News_Background")
                            .resizable()
                            .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.8), radius: 3, x: 0, y: 0)
                            .scaledToFit())
                        .onTapGesture {
                            print("vdehguvydsgviudscvsxivudsviudsviudsbnioudsbvuydsbgvuydsgou")
                            self.newActive = new
                            self.showNew = true
                        }
                        .padding(5)
                        
                    }
                    NavigationLink(destination: NewView(new: newActive), isActive: $showNew){
                        Text("")
                    }.disabled(true)
                }
                
            }.onAppear(){
                News = DataManager.NewsList
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
