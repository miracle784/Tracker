import UIKit

final class RootTabBarController: UITabBarController {

    private let trackerStore: TrackerStore
    private let trackerCategoryStore: TrackerCategoryStore
    private let trackerRecordStore: TrackerRecordStore

    init(
        trackerStore: TrackerStore,
        trackerCategoryStore: TrackerCategoryStore,
        trackerRecordStore: TrackerRecordStore
    ) {
        self.trackerStore = trackerStore
        self.trackerCategoryStore = trackerCategoryStore
        self.trackerRecordStore = trackerRecordStore
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    private func setupTabs() {
        let trackersVC = TrackersViewController(
            trackerStore: trackerStore,
            trackerCategoryStore: trackerCategoryStore,
            trackerRecordStore: trackerRecordStore
        )
        let statisticsVC = StatisticsViewController()

        let trackersNav = UINavigationController(rootViewController: trackersVC)

        trackersNav.tabBarItem = UITabBarItem(
            title: NSLocalizedString("trackers_title", comment: "Trackers tab title"),
            image: UIImage(resource: .trackers),
            selectedImage: nil
        )

        statisticsVC.tabBarItem = UITabBarItem(
            title: NSLocalizedString("statistics_title", comment: "Statistics tab title"),
            image: UIImage(resource: .stats),
            selectedImage: nil
        )

        viewControllers = [trackersNav, statisticsVC]
    }
}
