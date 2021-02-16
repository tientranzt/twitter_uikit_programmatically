//
//  ProfileFilter.swift
//  twitter_clone
//
//  Created by tientran on 11/02/2021.
//

import UIKit

private let reuseIdentifier = "ProfileFilerCell"

protocol ProfileFilterDelegate : class {
    func filterIndexHandle(_ view : ProfileFilter, didSelected indexPath : IndexPath)
}
class ProfileFilter: UIView {
    
    weak var delegate : ProfileFilterDelegate?
    
    // MARK: - properties
    lazy var collectionView : UICollectionView = {
        let layout =  UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(ProfileFilterCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        addSubview(collectionView)
        collectionView.addConstraintsToFillView(self)
        collectionView.backgroundColor = .white
        
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileFilter : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileFilterCell
        
        let options = ProfileFilterOptions(rawValue: indexPath.row)
        cell.options = options
        return cell
    }
}

extension ProfileFilter : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.filterIndexHandle(self, didSelected: indexPath)
    }
}

extension ProfileFilter : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width / 3 - 6, height: frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}


