//
//  Extensions.swift
//  VSAlert
//
//  Created by Vatsal Shukla on 25/07/22.
//

import UIKit

//MARK: - UICollectionReusableView
extension UICollectionReusableView {
    
    ///Use class name as ReuseIdentifire
    static var id:String {
        return String(describing: self)
    }
    
    ///Use class name to get UINib
    static var xib:UINib {
        return UINib(nibName: id, bundle: .main)
    }
    
    class func reuseHeader(on cln:UICollectionView,at ip:IndexPath) -> Self {
        return initialise(on: cln, at: ip, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader)
    }
    
    class func reuseFooter(on cln:UICollectionView,at ip:IndexPath) -> Self {
        return initialise(on: cln, at: ip, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionFooter)
    }
    
    class private func initialise<T:UICollectionReusableView>(on cln:UICollectionView,at ip:IndexPath, viewForSupplementaryElementOfKind kind:String) -> T {
        return cln.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: ip) as! T
    }
    
}

//MARK: - UICollectionViewCell
extension UICollectionViewCell {
    
    class func reuseCell(on cln:UICollectionView,at ip:IndexPath) -> Self {
        return initialise(on: cln, at: ip)
    }
    
    class private func initialise<T:UICollectionViewCell>(on cln:UICollectionView,at ip:IndexPath) -> T {
        return cln.dequeueReusableCell(withReuseIdentifier: id, for: ip) as! T
    }
}

//MARK: - String+Size Extension
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

