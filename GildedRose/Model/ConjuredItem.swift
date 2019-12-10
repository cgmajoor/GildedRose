//
//  ConjuredItem.swift
//  GildedRose
//
//  Created by Ceren Gazioglu Majoor on 05/12/2019.
//  Copyright © 2019 Lucium. All rights reserved.
//

public class ConjuredItem: Good {
    override class var qualityChangeNormal:Int { return super.qualityChangeNormal * 2 }
    override class var qualityChangeSellInPassed:Int { return super.qualityChangeSellInPassed * 2 }
}

extension ConjuredItem {
    override func updateQuality() {
        if self.sellInDatePassed() {
            self.setQuality(self.getQuality() + ConjuredItem.qualityChangeSellInPassed)
        } else{
            self.setQuality(self.getQuality() + ConjuredItem.qualityChangeNormal)
        }
    }
}

