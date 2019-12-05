//
//  Good.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//


public class Good: Item {
    
}

extension Good: QualityChanging {
    func updateQuality() {
        if self.sellIn <= 0 {
            self.setQuality(self.quality - 2)
        } else{
            self.setQuality(self.quality - 1)
        }
        self.checkQualityRange(between: 0, and: 50)
    }
}

extension Good: Sellable {
    func updateSellIn(by quantity: Int) {
        self.sellIn += quantity
    }
}
