//
//  StrechyHeaderLayout.swift
//  HeaderCollectionView
//
//  Created by Elliot Glaze on 05/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class StrechyHeaderLayout: UICollectionViewFlowLayout {
    //Modify attributes for the header
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else {return}
                
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffsetY
                
                //header
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })

        return layoutAttributes
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    

}
