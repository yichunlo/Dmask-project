//
//  AppView.swift
//  Dmask_replace
//
//  Created by 羅義鈞 on 2020/10/10.
//

import SwiftUI



struct AppView: View {
    var body: some View {
        TabView{
            HomeView().tabItem {
                Image("home_icon")
                Text("Home")
            }
            MediaView().tabItem {
                Image("widgets_icon")
                Text("Media")
            }
            Mask().tabItem {
                Image("mask_icon")
                Text("Mask")
            }
            Profile().tabItem {
                Image("face_icon")
                Text("Profile")
            }
        }.accentColor(.red)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }.background(Color.white)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
