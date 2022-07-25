//
//  DynamicHeightCollectionView.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit


class DynamicHeightCollectionView: UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

