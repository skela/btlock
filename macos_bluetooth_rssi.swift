import Foundation
import IOBluetooth

// Syntax: swift macos_bluetooth_rssi.swift "{bluetooth_device_id}" for instance "XY:AB:CD:EF:00"
// Returns the rssi signal strength of the device with the {bluetooth_device_id}
// Returns not_connected if the device was not found

open class BluetoothScanner
{
    let address : String
    let device : IOBluetoothDevice?

    public init(address:String)
    {
        self.address = address
        device = IOBluetoothDevice(addressString:address)
    }

    func connect()
    {
        device?.openConnection()
    }

    func disconnect()
    {
        device?.closeConnection()
    }
    
    public var name : String?
    {
        return device?.name
    }
    
    public var rssi : Int?
    {
        if let r = device?.rssi()
        {
            let ri = Int(r)
            guard ri != 127 else { return nil }
            return ri
        }
        return nil
    }
}

func main()
{
    let args = CommandLine.arguments
    
    guard args.count > 1 else { print("Error:Invalid syntax\nCorrect usage: swift macos_bluetooth_rssi.swift \"{bluetooth_device_id}\""); return }
    
    let address = args[1]

    let tester = BluetoothScanner(address:address)
    tester.connect()

    print(tester.rssi ?? "not_connected")
    //print(tester.name ?? "unknown")

    tester.disconnect()
}

main()
