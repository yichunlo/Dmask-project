//
//  Profile.swift
//  Dmask_replace
//
//  Created by 羅義鈞 on 2020/10/10.
//

import SwiftUI
import CoreBluetooth
//import PythonKit


struct Profile: View {
    
    @ObservedObject var bleManager = BLEManager()
    
    
    var body: some View {
        VStack{
            Text("Profile").font(.largeTitle).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .leading).padding(30)
            
            Image("profile_image").resizable().frame(width: 120, height: 120)
            Divider()
            VStack {
                HStack {
                    Text("Name")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.leading).padding()
                    Text("Yi Chun Lo").font(.system(size: 20))
                }.offset(x: -33)
                HStack {
                    Text("Email")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.leading).padding()
                    Text("b07902127@ntu.edu.tw").font(.system(size: 15)).offset(x: 5)
                }.offset(y: -25)
                        //
                Text("BLUETOOTH").font(.largeTitle).bold().offset(y: 30)
                
                
                List(bleManager.peripherals) { peripheral in
                    
                    if peripheral.name == "nmsl" {
                        //self.bleManager.special = peripheral
                        VStack{
                            HStack {
                                Text("Name")
                                Spacer()
                                Text("rssi")
                                Spacer()
                                Text("ID").padding()
                            }
                            //self.bleManager.connectToTarget(peripheral)
                            HStack{
                                Text(peripheral.name)
                                Spacer()
                                Text(String(peripheral.rssi))
                                Spacer()
                                Text(String(peripheral.id)).padding()
                                //Spacer()
                            }
                        }
                    }
                }
                HStack (spacing: 10) {
                    Button(action: {
                        self.bleManager.startScanning()
                    }){
                        Text("Start Scanning").foregroundColor(Color.blue)
                    }.padding()
                    Button(action: {
                        self.bleManager.stopScanning()
                    }){
                        Text("Stop Scanning")
                    }
                }.padding()
                        
            }
            Spacer()
        }
    }
}

 //


struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
