import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate,FlutterToNative{
    func loadNativeInfo(id: Int64) throws -> NativeBean {
        let nativeBean = NativeBean(id: 0, name: "测试 ");
        return nativeBean
    }
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller = window?.rootViewController as! FlutterViewController;
        let channel = FlutterMethodChannel(name: "samples.flutter.dev/battery",
                                                binaryMessenger: controller.binaryMessenger);
        channel.setMethodCallHandler { (call, result) in
            if call.method == "getBatteryLevel" {
                self.receiveBatteryLevel(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
      FlutterToNativeSetup.setUp(binaryMessenger: controller.binaryMessenger, api: self);
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func receiveBatteryLevel(result: FlutterResult) {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
        result(FlutterError(code: "UNAVAILABLE",
                            message: "Battery level not available.",
                            details: nil))
      } else {
        result(Int(device.batteryLevel * 100))
      }
    }
}
