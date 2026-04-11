import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private var trackerStore: TrackerStore?
    private var trackerCategoryStore: TrackerCategoryStore?
    private var trackerRecordStore: TrackerRecordStore?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let context = appDelegate.coreDataStack.context

        let trackerStore = TrackerStore(context: context)
        let trackerCategoryStore = TrackerCategoryStore(context: context)
        let trackerRecordStore = TrackerRecordStore(context: context)

        self.trackerStore = trackerStore
        self.trackerCategoryStore = trackerCategoryStore
        self.trackerRecordStore = trackerRecordStore

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = RootTabBarController(
            trackerStore: trackerStore,
            trackerCategoryStore: trackerCategoryStore,
            trackerRecordStore: trackerRecordStore
        )
        self.window = window
        window.makeKeyAndVisible()
    }
}

