import Flutter
import UIKit

public class SwiftDeviceInfoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_info", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceInfoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      
      guard call.method == "getDeviceInfo" else{
          result(FlutterMethodNotImplemented)
          return
      }
      
      let device = UIDevice.current
      
      var deviceInfo = [String : String]()
      deviceInfo["deviceName"]=device.name
      deviceInfo["manufacturer"]="Apple"
      deviceInfo["iosVersion"]=device.systemVersion
      deviceInfo["brand"]=device.localizedModel
      deviceInfo["batteryLevel"]=String(device.batteryLevel)
      deviceInfo["OS"]=device.systemName
    result(deviceInfo)
  }
}
