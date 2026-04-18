import Foundation

final class NewCategoryViewModel {
    
    var onButtonStateChanged: ((Bool) -> Void)?
    var onCategoryCreated: (() -> Void)?
    
    private let categoryStore: TrackerCategoryStore
    private var categoryTitle: String = ""
    
    init(categoryStore: TrackerCategoryStore) {
        self.categoryStore = categoryStore
    }
    
    func updateCategoryTitle(_ text: String?) {
        categoryTitle = text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        onButtonStateChanged?(!categoryTitle.isEmpty)
    }
    
    func createCategory() {
        guard !categoryTitle.isEmpty else { return }
        
        do {
            try categoryStore.addCategory(title: categoryTitle)
            onCategoryCreated?()
        } catch {
            print("Failed to create category: \(error)")
        }
    }
}
