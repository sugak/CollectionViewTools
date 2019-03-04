//
//  Copyright © 2019 Rosberry. All rights reserved.
//

public struct CollectionViewChange<T> {

    let insertedItem: T?
    let insertedIndex: Int?
    let deletedItem: T?
    let deletedIndex: Int?
    let replacedItem: T?
    let oldReplacedItem: T?
    let replacedIndex: Int?

    public init(insertedItem: T?,
                insertedIndex: Int?,
                deletedItem: T?,
                deletedIndex: Int?,
                replacedItem: T?,
                oldReplacedItem: T?,
                replacedIndex: Int?) {
        self.insertedItem = insertedItem
        self.insertedIndex = insertedIndex
        self.deletedItem = deletedItem
        self.deletedIndex = deletedIndex
        self.replacedItem = replacedItem
        self.oldReplacedItem = oldReplacedItem
        self.replacedIndex = replacedIndex
    }
}

final class CollectionViewChanges<T> {

    let insertedItems: [T]
    let insertedIndexes: [Int]
    let deletedItems: [T]
    let deletedIndexes: [Int]
    let replacedItems: [T]
    let oldReplacedItems: [T]
    let replacedIndexes: [Int]

    init(changes: [CollectionViewChange<CollectionViewDiffableItemWrapper>]) {
        self.insertedItems = changes.compactMap { $0.insertedItem?.item as? T }
        self.insertedIndexes = changes.compactMap { $0.insertedIndex }
        self.deletedItems = changes.compactMap { $0.deletedItem?.item as? T }
        self.deletedIndexes = changes.compactMap { $0.deletedIndex }
        self.replacedItems = changes.compactMap { $0.replacedItem?.item as? T }
        self.oldReplacedItems = changes.compactMap { $0.oldReplacedItem?.item as? T }
        self.replacedIndexes = changes.compactMap { $0.replacedIndex }
    }
}