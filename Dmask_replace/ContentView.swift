//
//  ContentView.swift
//  DMask_replace
//
//  Created by 羅義鈞 on 2020/10/9.
//

import SwiftUI


struct ContentView: View {
    
    //@State private var selection: String? = nil
    
    var body: some View {
        VStack{
            HStack {
                Text("Home").font(.largeTitle).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding()
                    
            }
            //Spacer()
            ScrollView(.vertical) {
                Image("beginner_guide").resizable().frame(width: 320, height: 200)
                Image("new_feature").resizable().frame(width: 320, height: 200)
                Image("about_dmask").resizable().frame(width: 320, height: 200)
                Image("join_us").resizable().frame(width: 320, height: 200)
                Spacer()
            }
        }
        .padding(.leading)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
    }
}
