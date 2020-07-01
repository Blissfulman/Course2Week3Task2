//
//  CollectionViewController.swift
//  Course2Week3Task2
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let photosForCollection = PhotoProvider().photos()

    @IBOutlet weak var photoCollectionView: UICollectionView!

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosForCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell

        cell.configure(with: photosForCollection[indexPath.item])
        
        cell.layoutSubviews()

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.photoCollectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")
        
        photoCollectionView.contentInset = UIEdgeInsets(top: -8, left: 8, bottom: -8, right: 8)

        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
    }
}
