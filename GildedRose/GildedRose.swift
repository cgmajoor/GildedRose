//
//  GildedRose.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 04/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//


public class GildedRose {
    var items:[Item]
    
    required public init(items:[Item]) {
        self.items = items
    }
    
    fileprivate func updateQualityOf(_ item: QualityChanging) {
        item.updateQuality()
    }
    
    fileprivate func updateSellInOf(_ item: Sellable) {
        item.updateSellIn(by: -1)
    }
    
    public func updateQuality() {
        for item in items {
            //print("\(#file) \(#function) \(#line): itemDescription: \(item.description)")
            
            if let qualityChangingItem = item as? QualityChanging {
                updateQualityOf(qualityChangingItem)
            }
            
            if let sellableItem = item as? Sellable {
                updateSellInOf(sellableItem)
            }
        }
    }
    
}
