//
//  HomeView.swift
//  Dmask_replace
//
//  Created by 羅義鈞 on 2020/10/10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            
            Text("Home").font(.largeTitle).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(20).offset(x: 10)
                    
            
            //Spacer()
            ScrollView(.vertical) {
                Image("beginner_guide").resizable().frame(width: 320, height: 200)
                Image("new_feature").resizable().frame(width: 320, height: 200)
                Image("about_dmask").resizable().frame(width: 320, height: 200)
                Image("join_us").resizable().frame(width: 320, height: 200)
                Spacer()
            }.offset(x: -10)
        }
        .padding(.leading)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
