//
//  CustomFlowLayout.swift
//  Course2Week3Task2
//

import UIKit

class CustomFlowLayout: UICollectionViewLayout {

    // Количество столбцов
    private let numberOfColumns = 2
    
    // Промежуток между ячейками
    private let cellPadding: CGFloat = 8

    // Массив для кэширования вычисляемых атрибутов
    private var cache: [UICollectionViewLayoutAttributes] = []

    // Свойства для хранения размера содержимого
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    // Возвращает размер содержимого представления коллекции
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func prepare() {
        
        // Проверка, что кэш не пустой, и наличия представления коллекции
        guard
            cache.isEmpty,
            let collectionView = collectionView
            else {
                return
        }
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)

        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)

            // Установка высоты картинок
            let photoHeight = CGFloat(indexPath.item == 0 ? 300 : 200)
            
            let height = cellPadding * 2 + photoHeight
            
            let frame = CGRect(x: xOffset[column],
                               y: yOffset[column],
                               width: columnWidth,
                               height: height)
            
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)

            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)

            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            // Выбор менее заполненной колонки
            column = yOffset[0] < yOffset[1] ? 0 : 1
        }
    }

    override func layoutAttributesForElements(in rect: CGRect)
        -> [UICollectionViewLayoutAttributes]? {
            var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
            for attributes in cache {
                if attributes.frame.intersects(rect) {
                    visibleLayoutAttributes.append(attributes)
                }
            }
            return visibleLayoutAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            return cache[indexPath.item]
    }
}
