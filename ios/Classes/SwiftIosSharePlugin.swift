import Flutter
import UIKit

public class SwiftIosSharePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ios_share", binaryMessenger: registrar.messenger())
    let instance = SwiftIosSharePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "shared") {
        self.showSharedActivityViewController(arguments: call.arguments)
        result(call.arguments)
        return
    }

    result(FlutterMethodNotImplemented)
  }


  private func showSharedActivityViewController(arguments: Any?) {
     if let args = arguments as? Dictionary<String, Any?> , !args.isEmpty {
        let data = NSData.init(contentsOfFile: args["url"] as! String)
        let fileURL = URL.init(fileURLWithPath: args["url"] as! String)

        let viewController = UIActivityViewController(activityItems: [ data, fileURL ], applicationActivities: nil)
        let controller = UIApplication.shared.keyWindow!.rootViewController as! FlutterViewController
        viewController.popoverPresentationController?.sourceView = controller.view
        controller.show(viewController, sender: self)
     }
  }
}
