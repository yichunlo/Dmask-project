//
//  BLEManager.swift
//  testing
//
//  Created by 羅義鈞 on 2020/10/10.
//

import Foundation
import CoreBluetooth

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    var myCentral: CBCentralManager!
    @Published var peripherals = [Peripheral]()
    @Published var special = Peripheral(id: 0, name: "unknown", rssi: 0)
    @Published var isSwitchedOn = false
    
    override init() {
        super.init()
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }
    func connectToTarget(_ peripheral: CBPeripheral){
        myCentral.connect(peripheral)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
        }
        else {
            isSwitchedOn = false
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
       
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
            let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
            //print(newPeripheral)
            peripherals.append(newPeripheral)
        }
        
    }
    
    func startScanning() {
            print("startScanning")
            myCentral.scanForPeripherals(withServices: nil, options: nil)
    }
    func stopScanning() {
            print("stopScanning")
            myCentral.stopScan()
    }

}
