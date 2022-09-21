import Flutter
import UIKit

public class SwiftUniPdfPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "uni_pdf", binaryMessenger: registrar.messenger())
    let instance = SwiftUniPdfPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch(call.method){
        case "getPlatformVersion":result("iOS " + UIDevice.current.systemVersion)
      case "isEncrypted":do {
          let arg = call.arguments as! Dictionary<String, Any>
          let path = arg["path"] as! String
          print(path)
          let fileUrl = URL(fileURLWithPath: path)
          let pdf: CGPDFDocument! = CGPDFDocument(fileUrl as CFURL)
          result(pdf.isEncrypted)
      }
      case "isPasswordCorrect" :do{
          let arg = call.arguments as! Dictionary<String, Any>
          let path = arg["path"] as! String
          let password = arg["password"] as! String
          print(path)
          let fileUrl = URL(fileURLWithPath: path)
          let pdf: CGPDFDocument! = CGPDFDocument(fileUrl as CFURL)
          result(pdf.unlockWithPassword(password))
      }
          
        default:result("default")
      }
  }
}
