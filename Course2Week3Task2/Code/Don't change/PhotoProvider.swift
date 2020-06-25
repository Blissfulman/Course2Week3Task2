//
//  PhotoProvider.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class PhotoProvider {
    func photos() -> [Photo] {
        return [Photo(image: UIImage(named: "breakfast.jpg")!, name: "Breakfast"),
                Photo(image: UIImage(named: "flowers.jpg")!, name: "Flowers"),
                Photo(image: UIImage(named: "island.jpg")!, name: "Island"),
                Photo(image: UIImage(named: "lightbulb.jpg")!, name: "Lightbulb"),
                Photo(image: UIImage(named: "stars.jpg")!, name: "Stars"),
                Photo(image: UIImage(named: "strawberries.jpg")!, name: "Strawberries"),
                Photo(image: UIImage(named: "tree.jpg")!, name: "Tree"),
                Photo(image: UIImage(named: "village.jpg")!, name: "Village"),
                Photo(image: UIImage(named: "watch.jpg")!, name: "Watch"),
                Photo(image: UIImage(named: "water.jpg")!, name: "Water"),
                Photo(image: UIImage(named: "waterfall.jpg")!, name: "Waterfall"),
                Photo(image: UIImage(named: "ballon@3x.jpg")!, name: "Ballon"),
                Photo(image: UIImage(named: "coffee@3x.jpg")!, name: "Coffee"),
                Photo(image: UIImage(named: "mountain@3x.jpg")!, name: "Mountain"),
                Photo(image: UIImage(named: "mushroom@3x.jpg")!, name: "Mushroom"),
                Photo(image: UIImage(named: "snowman@3x.jpg")!, name: "Snowman"),
                Photo(image: UIImage(named: "sunset@3x.jpg")!, name: "Sunset")]
    }
}
