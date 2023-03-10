//
//  FriendsCellListView.swift
//  Westfield_App
//
//  Created by Apps2M on 13/2/23.
//

import SwiftUI

struct FriendsCellListView: View {
    @State var friend: Friend
    
    var body: some View {
        HStack{
            
            Image(uiImage: friend.avatarImage ?? UIImage(named: "PROFILE")!)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 70, height: 70)
            

            Text(friend.userName)
                .bold()
                .foregroundColor(Color.white)
                .padding()
                
        }
        
    }
    
}
