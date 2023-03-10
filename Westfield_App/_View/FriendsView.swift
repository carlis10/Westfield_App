//
//  FriendsView.swift
//  Westfield_App
//
//  Created by Apps2M on 13/2/23.
//

import SwiftUI

struct FriendsView: View {
    
    init () {
        UITableView.appearance().backgroundColor = UIColor(Color.init(hex: "F3F0E9"))
    }

    
    @State var search: String = ""
    var body: some View {
        GeometryReader{ g in
        ZStack{
            Color.init(hex: "F3F0E9")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:1){
                
                Image("Friends")
                    .resizable()
                    .frame(width: 280, height: 70)
                    .shadow(color: Color.init(red: 0, green: 0, blue: 0, opacity: 0.6), radius: 5, x: 0, y: 3)
                    .padding()
                .font(.title2)
                Image("fondo3")
                    .resizable()
                    .frame(width: g.size.width * 0.95, height: 20)
                List(SteamNetwork.friendsList){friend in
                    Section{
                        FriendsCellListView(friend: friend)
                        
                    }.listRowBackground(Image("fondo2")
                        .resizable()
                        .scaledToFit())
                    .padding()
                }
            }
            
        }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    
    static var previews: some View {
        FriendsView()
    }
}
