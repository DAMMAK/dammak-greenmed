import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    //Google Service API key
     GMSServices.provideAPIKey("AIzaSyDzdlRoBv_DZimDX0OpSoLiLLcRTga3RBg")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
