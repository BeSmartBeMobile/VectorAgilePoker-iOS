import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Fabric.with([Crashlytics.self])

        let window = UIWindow()
        window.makeKeyAndVisible()

        let mainRouter = MainRouter(window: window)
        mainRouter.presentRootViewController()

        MainRouter.apply(window)

        self.window = window

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }
}
