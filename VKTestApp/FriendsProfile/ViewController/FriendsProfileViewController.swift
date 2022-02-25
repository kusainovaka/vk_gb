//
//  FriendsProfileViewController.swift
//  VKTestApp
//
//  Created by Kamila Kussainova on 27.01.2022.
//

import UIKit

class FriendsProfileViewController: UICollectionViewController {
    private let headerView = "headerView"
    private let footerView = "footerView"
    private let width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Cell
        collectionView!.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.cellId)
        // HeaderView
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerView)
        // FooterView
        collectionView.register(ProfileHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerView)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.cellId, for: indexPath) as! ProfileCollectionViewCell
        cell.backgroundColor = .blue
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerView, for: indexPath) as! ProfileHeaderView
            view.backgroundColor = .brown
            view.setText("Hello header view")
            return view
        } else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerView, for: indexPath) as! ProfileHeaderView
            view.backgroundColor = .systemPink
            view.setText("Hello footer view")
            return view
        }
    }
}

extension FriendsProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: width, height: 100)
    }
}
