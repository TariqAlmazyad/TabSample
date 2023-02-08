//
//  ContentView.swift
//  TabSample
//
//  Created by AA on 2/8/23.
//

import SwiftUI
enum TabSection: String, CaseIterable {
    case home
    case profile
    case search
    case notifications
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        }
    }
}

struct ContentView: View {
    @State var selectedTab: TabSection = .home
    var body: some View {
        TabView(selection: $selectedTab) {
            switch selectedTab {
            case .home:
                ScrollView{
                    LazyVGrid(columns: [GridItem.init(), GridItem.init(), GridItem.init()]) {
                        ForEach(0 ..< 50) { item in
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color.random)
                            HStack{Spacer()}
                        }
                    }
                }
            case .profile:
                Text("profile")
            case .search:
                Text("search")
            case .notifications:
                Text("notifications")
            }
        }.tabViewStyle(.page(indexDisplayMode: .never))
        .overlay(alignment: .bottom) {
            HStack(spacing: 10){
                ForEach(TabSection.allCases, id:\.self) { tab in
                    Spacer()
                    Button {
                        withAnimation {
                            selectedTab = tab
                        }
                    } label: {
                        Image(systemName: tab.imageName)
                            .foregroundColor(selectedTab == tab ? .white : .blue)
                            .scaleEffect(selectedTab == tab ? 1.2 : 1)
                            .imageScale(.large)
                    }
                    Spacer()
                }
            }
            .frame(height: 80)
            .padding(.horizontal)
            .background(Material.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
  
