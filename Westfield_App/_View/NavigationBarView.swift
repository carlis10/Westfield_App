//
//  NavigationBarView.swift
//  Westfield_App
//
//  Created by Apps2M on 10/2/23.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case home
    case inventory
    case game
    case friends
    case profile
    
    var description: String {
        switch self {
        case .home:
            return "Home"
        case .inventory:
            return "Inventory"
        case .game:
            return "Game"
        case .friends:
            return "Friends"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "Icon-Home"
        case .inventory:
            return "Icono-Inventario"
        case .game:
            return "Icon-Blackjack-Remastered"
        case .friends:
            return "Icon-Friends-2"
            
        case .profile:
            return "PROFILE"
        }
    }
    
    var icon_selected: String {
        switch self {
        case .home:
            return "Icon-Home-Red"
        case .inventory:
            return "Icono-Inventario-Red"
        case .game:
            return "Icon-Blackjack-Remastered"
        case .friends:
            return "Icon-Friends"
            
        case .profile:
            return "PROFILE-2"
        }
    }
}
extension UIApplication {
    static var safeAreaInsets: UIEdgeInsets  {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return scene?.windows.first?.safeAreaInsets ?? .zero
    }
}
struct NavigationBarView : View {
    var tabItems = TabItem.allCases
    
    @State var selected: TabItem = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View{
            
        
        VStack(spacing: 0){
            TabView(selection: $selected){
                
                HomeView()
                    .tag(tabItems[0])
                    //.ignoresSafeArea(.all)
                
                InventoryView()
                    .tag(tabItems[1])
                    //.ignoresSafeArea(.all)
                
                BlackJackView()
                    .tag(tabItems[2])
                    //.ignoresSafeArea(.all)
                    .navigationBarTitleDisplayMode(.inline                                   )
                FriendsView()
                    .tag(tabItems[3])
                    //.ignoresSafeArea(.all)
                ProfileView()
                    .tag(tabItems[4])
                    //.ignoresSafeArea(.all)
            }
            CustomTabbarView(tabItems: tabItems, selected: $selected)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}
struct CustomTabbarView: View {
    var tabItems: [TabItem]
    @State var centerX : CGFloat = 0
    @Environment(\.verticalSizeClass) var size
    @Binding var selected: TabItem
    
    init(tabItems: [TabItem], selected: Binding<TabItem>) {
        UITabBar.appearance().isHidden = true
        self.tabItems = tabItems
        self._selected = selected
    }
    
    var body: some View {
        HStack(spacing: 0){
            
            ForEach(tabItems,id: \.self){value in
                
                GeometryReader{ proxy in
                    BarButton(selected: $selected, centerX: $centerX, rect: proxy.frame(in: .global), value: value)
                        .onAppear(perform: {
                            if value == tabItems.first{
                                centerX = proxy.frame(in: .global).midX
                            }
                        })
                        .onChange(of: size) { (_) in
                            if selected == value{
                                centerX = proxy.frame(in: .global).midX
                            }
                        }
                }
                .frame(width: 70, height: 50)
                if value != tabItems.last{Spacer(minLength: 0)}
            }
        }
        .padding(.horizontal,25)
        .padding(.top)
        .padding(.bottom,UIApplication.safeAreaInsets.bottom == 0 ? 15 : UIApplication.safeAreaInsets.bottom)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
        .padding(.top,-15)
        .ignoresSafeArea(.all, edges: .horizontal)
        .background(Color.init(hex: "111111"))
    }
}
struct BarButton : View {
    @Binding var selected : TabItem
    @Binding var centerX : CGFloat
    
    var rect : CGRect
    var value: TabItem
    
    var body: some View{
        Button(action: {
            withAnimation(.spring()){
                selected = value
                centerX = rect.midX
            }
        }, label: {
            VStack{
                if (selected != value){
                Image(value.icon)
                    .resizable()
                    .renderingMode(value.icon == "Icon-Blackjack-Remastered" ? .template : .original)
                    .frame(width: 30, height: 30)
                    .rotation3DEffect(Angle(degrees: 0), axis: (x: 0, y: 1, z: 0))
                    .foregroundColor(value.icon == "Icon-Blackjack-Remastered" ? .white : .indigo)
                }
                else{
                    Image(value.icon_selected)
                        .resizable()
                        //.renderingMode(.template)
                        .frame(width: 30, height: 30)
                        //.foregroundColor(selected == value ? .indigo : .gray)
                }
                Text(value.description)
                    .font(.caption)
                    .foregroundColor(.white)
                    .opacity(selected == value ? 1 : 0)
            }
            .padding(.top)
            .frame(width: 70, height: 70)
            //.offset(y: selected == value ? -7 : 0)
        })
    }
}
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
