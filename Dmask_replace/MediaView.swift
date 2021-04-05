//
//  MediaView.swift
//  Dmask_replace
//
//  Created by 羅義鈞 on 2020/10/9.
//

import SwiftUI
import PythonKit
import CoreBluetooth



struct MediaView: View {
    var centralManager: CBCentralManager!
    var myPeripheral: CBPeripheral!
    let timer = Timer.publish(every: 1.6, on: .main, in: .common).autoconnect()
    
    @State var leftOffset: CGFloat = -110
    @State var rightOffset: CGFloat = 30
    @State private var shouldAnimate = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Media").font(.largeTitle).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 40).offset(y: 20)
            ZStack(){
                //Rectangle 7
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(#colorLiteral(red: 0.9186848998069763, green: 0.9186848998069763, blue: 0.9186848998069763, alpha: 1)))
                .frame(width: 287, height: 30)
                //more Image, GIF...
                Text("more Image, GIF...").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.54, blue: 0.54, alpha: 1))).tracking(1.26)
            }.offset(y: 10)
            //Spacer()
            ScrollView{
                Text("Image").font(.subheadline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .leading).padding(50)
                
                ScrollView(.horizontal){
                    VStack {
                        HStack {
                            Button(action: {
                                //print(Python.version)
                                //Image("smile")
                            }){
                                Image("smile").resizable().frame(width: 110, height: 100, alignment: .center).padding()
                            }
                            Button(action: {}){
                                Image("media_image1").resizable().frame(width: 100, height: 100, alignment: .leading).padding().offset(x: -5)
                            }
                            Button(action: {}){
                                Image("media_image2").resizable().frame(width: 100, height: 100, alignment: .leading).padding().offset(x: -5)
                            }
                            Spacer()
                        }
                        HStack{
                            Button(action: {}){
                                Image("media_image3").resizable().frame(width: 100, height: 100, alignment: .leading).padding()
                            }
                            Button(action: {}){
                                Image("media_image4").resizable().frame(width: 100, height: 100, alignment: .leading).padding()
                            }
                            Button(action: {}){
                                Image("media_image5").resizable().frame(width: 100, height: 100, alignment: .leading).padding()
                            }
                            Spacer()
                        }
                    }.offset(y: -20)
                }
                
                Text("GIF").font(.subheadline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(maxWidth: .infinity, alignment: .leading).padding(50).offset(y: -30)
                HStack{
                    ZStack {
                        Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .offset(x: leftOffset)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1))
                        Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .offset(x: leftOffset)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.2))
                        Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .offset(x: leftOffset)
                        .opacity(0.7)
                        .animation(Animation.easeInOut(duration: 1).delay(0.4))
                    }.onReceive(timer) { (_) in
                        swap(&self.leftOffset, &self.rightOffset)
                    }
                    HStack {
                        Circle()
                        .fill(Color.yellow)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever())
                        Circle()
                        .fill(Color.yellow)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.3))
                                Circle()
                        .fill(Color.yellow)
                        .frame(width: 20, height: 20)
                        .scaleEffect(shouldAnimate ? 1.0 : 0.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever().delay(0.6))
                    }
                    .onAppear {
                        self.shouldAnimate = true
                    }.offset(x: 100)
                }.offset(y: -50)
                Spacer()
            }
            Spacer()
        }
        
    }
}

//func 

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView()
    }
}
