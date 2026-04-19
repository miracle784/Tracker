import SnapshotTesting
import XCTest
@testable import Tracker

final class TrackerTests: XCTestCase {
    
    private var coreDataStack: CoreDataStack!
    private var trackerStore: TrackerStore!
    private var trackerCategoryStore: TrackerCategoryStore!
    private var trackerRecordStore: TrackerRecordStore!
    
    override func setUp() {
        super.setUp()
        isRecording = false
        
        coreDataStack = CoreDataStack()
        trackerCategoryStore = TrackerCategoryStore(context: coreDataStack.context)
        trackerStore = TrackerStore(context: coreDataStack.context)
        trackerRecordStore = TrackerRecordStore(context: coreDataStack.context)
    }
    
    override func tearDown() {
        trackerRecordStore = nil
        trackerStore = nil
        trackerCategoryStore = nil
        coreDataStack = nil
        super.tearDown()
    }
    
    func testTrackersViewControllerLight() {
        // Given
        let viewController = TrackersViewController(
            trackerStore: trackerStore,
            trackerCategoryStore: trackerCategoryStore,
            trackerRecordStore: trackerRecordStore
        )
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // When
        let result = navigationController
        
        // Then
        assertSnapshot(
            of: result,
            as: .image(traits: .init(userInterfaceStyle: .light))
        )
    }
    
    func testTrackersViewControllerDark() {
        // Given
        let viewController = TrackersViewController(
            trackerStore: trackerStore,
            trackerCategoryStore: trackerCategoryStore,
            trackerRecordStore: trackerRecordStore
        )
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // When
        let result = navigationController
        
        // Then
        assertSnapshot(
            of: result,
            as: .image(traits: .init(userInterfaceStyle: .dark))
        )
    }
}
