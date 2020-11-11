//
//  FeedController.swift
//  Cocina1
//
//  Created by John Padilla on 11/4/20.
//

import UIKit


class FeedController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return UICollectionViewCell()
    }
}

//MARK: - UICollectionViewDataSource
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.width, height: 320)

//        let width = view.frame.width
//        var height = width + 8 + 45 + 8
//        height += 50
//        height += 90
//
//
//        return CGSize(width: width, height: height)
    }
}
